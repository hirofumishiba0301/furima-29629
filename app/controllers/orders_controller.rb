class OrdersController < ApplicationController
  def index
    @orders = Order.includes(:item)
  end
end
