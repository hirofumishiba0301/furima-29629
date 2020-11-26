class OrdersController < ApplicationController
  def index
    @order = Order.includes(:item)
    @item = Item.find(params[:item_id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :prefecture_id, :sale_id, :scheduled_id, :shipping_id, :price).merge(user_id: current_user.id)
  end

end
