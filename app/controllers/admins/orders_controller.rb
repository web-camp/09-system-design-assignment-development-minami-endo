class Admins::OrdersController < ApplicationController
  def index
  	orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  
  end

  def update
  end
  private

  def order_params
  	params.require(:order).permit(:order_status)
  end
end
