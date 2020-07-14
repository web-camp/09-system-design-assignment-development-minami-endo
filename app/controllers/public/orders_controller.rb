class Public::OrdersController < ApplicationController
  def comfirm
    byebug
  end

  def new
    @order = Order.new
  end

  def completed
  end

  def create
    @order = Order.new(order_params)
    @order.save
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:method_of_payment, :name, :postal_code, :address, shipping_address: [:address_info])
  end
end
