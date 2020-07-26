class Admins::OrderProductsController < ApplicationController
  def update
  	@order_product = OrderProduct.find(params[:id])
    @order_product.update(order_product_params)

    if params[:order_product][:production_status] == "in_production"
    	order.update(order_status: "in_production")
    end

    total = 0
    @order_product.product.order_products.each do |order_product|
      if params[:order_product][:production_status] == "production_completed"
      	total += 1
      end
    end
    if total == order_product.conunt
    	order.update(order_status: "preparation_for_shipment")
    end

  redirect_to admins_orders_path
  end

  private
  def order_product_params
  	params.require(:order_product).permit(:production_status)
  end
end