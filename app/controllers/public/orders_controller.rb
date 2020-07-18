class Public::OrdersController < ApplicationController
  POSTAGE=800
  def comfirm
    @order_product=OrderProduct.new
    @order = Order.new
    @cart_products = current_customer.cart_products
    @price_on_purchase = 0
    @cart_products.each do |cart_product|
      @price_on_purchase += cart_product.product.non_taxed_price * 1.1.to_i * cart_product.count
    end

    if params[:order][:method_of_payment] == "クレジットカード"
      @method_of_payment = "クレジットカード"
    else
      @method_of_payment = "銀行振込"
    end

    if params[:select] == "1"
      @order.customer_id = current_customer.id
      @order.postal_code = current_customer.postal_code
      @postal_code=@order.postal_code
      @order.address = current_customer.address
      @address=@order.address
      @order.name = current_customer.first_name
      @first_name=@order.name
      @last_name=current_customer.last_name
      @order.postage = POSTAGE
      @order.method_of_payment = @method_of_payment
      @order.billing_amount = @price_on_purchase+POSTAGE
    elsif params[:select] == "2"
      @select_address = ShippingAddress.find(params[:order][:shipping_address_id])
      @address = @select_address.address_info
    elsif params[:select] == "3"
      @select_address = Order.new(order_params)
      @select_address.save
      @postal_code = @select_address.postal_code
      @address = @select_address.address
      @name = @select_address.name
    end

  end

  def new
    @order = Order.new
  end

  def completed
  end

  def create

    @order=Order.new(order_params)
    @order.save
    #current_customer.cart_products.each do |cart_product|
    #  @order_product = cart_product.product.order_products.new(order_id: cart_product.order.id, count: cart_product.count, price_on_purchase: cart_product.product.non_taxed_price)
    #  @order_product.save
    #  cart_product.destroy
    #end
  end

  def index
    @orders = Order.all
    
  end

  def show
  end
  private
  def order_params
    params.require(:order).permit(:customer_id, :postage, :method_of_payment, :name, :postal_code, :address, :billing_amount)
  end

end
