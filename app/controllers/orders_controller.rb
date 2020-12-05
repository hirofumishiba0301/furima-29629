class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    if (current_user.id == @item.user_id) || @item.order.present?
      redirect_to root_path
    else
      @order_ship = OrderShip.new
    end
  end

  def create
    @order_ship = OrderShip.new(order_ship_params)
    if @order_ship.valid?
      pay_item
      @order_ship.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_ship_params
    params.require(:order_ship).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_ship_params[:token],
      currency: 'jpy'
    )
  end
end
