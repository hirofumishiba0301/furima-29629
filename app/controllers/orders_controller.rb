class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id 
      redirect_to root_path
    end
    if @item.order.present?
      redirect_to root_path
    end
    @order_ship = OrderShip.new
  end

  def new
    @order_ship = OrgerShip.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_ship = OrderShip.new(order_ship_params)
    if @order_ship.valid?
      @order_ship.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_ship_params
    params.require(:order_ship).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
