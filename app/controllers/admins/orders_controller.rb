class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
    @order_products = @order.order_products
  end


  def update

    if params[:select_value] == "1"
      @order = Order.find(params[:id])
      @order.update(order_params)
      if params[:order][:order_status] == "payment_comfirmation"
        @order.order_products.each do |order_product|
          order_product.update(production_status: "awaiting_production")
        end
      end
      redirect_to admins_order_path(@order)
    elsif params[:select_value] == "2"
      @order_product = OrderProduct.find_by(product_id: params[:product_id])

      @order_product.update(order_product_params)

      if params[:order_product][:production_status] == "in_production"
        @order_product.order.update(order_status: "in_production")
      end

      total = 0
      @order_product.product.order_products.each do |order_product|
        if params[:order_product][:production_status] == "production_completed"
          total += 1
        end
      end
      if total == @order_product.product.order_products
        order.update(order_status: "preparation_for_shipment")
      end
      redirect_to admins_order_path(@order_product.order.id)
    end


   
 end



  private
  def order_params
  	params.require(:order).permit(:order_status)
  end
  def order_product_params
    params.require(:order_product).permit(:production_status)
  end

end
