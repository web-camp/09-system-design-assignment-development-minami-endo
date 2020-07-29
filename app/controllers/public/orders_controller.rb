class Public::OrdersController < ApplicationController
  POSTAGE = 800
  def comfirm
    @cart_products = current_customer.cart_products
    @order = Order.new
    @price_on_purchase = 0
    @cart_products.each do |cart_product|
      if cart_product.product.is_active == "now_sale"
        @price_on_purchase += cart_product.product.non_taxed_price.to_i * 1.1 * cart_product.count
      end
    end

    if params[:order][:method_of_payment] == "クレジットカード"
      @method_of_payment = "クレジットカード"
    else
      @method_of_payment = "銀行振込"
    end

    if params[:select] == "1"
      @order.customer_id = current_customer.id
      @order.postal_code = current_customer.postal_code
      @postal_code = @order.postal_code
      @order.address = current_customer.address
      @address = @order.address
      @order.name = current_customer.first_name
      @first_name = @order.name
      @last_name = current_customer.last_name
      @order.postage = POSTAGE
      @order.method_of_payment = @method_of_payment
      @order.billing_amount = @price_on_purchase + POSTAGE

    elsif params[:select] == "2"
      @select_address = ShippingAddress.find(params[:order][:shipping_address_id])
      @address = @select_address.address_info
      @order.customer_id = current_customer.id
      @order.postal_code = @select_address.postal_code
      @order.address = @select_address.address
      @order.name = @select_address.addressee
      @order.postage = POSTAGE
      @order.method_of_payment = @method_of_payment
      @order.billing_amount = @price_on_purchase + POSTAGE

    elsif params[:select] == "3"
      @new_address = Order.new(order_params)
      @new_address.save
      @postal_code = @new_address.postal_code
      @address = @new_address.address
      @name = @new_address.name
      @order.customer_id = current_customer.id
      @order.postal_code = @new_address.postal_code
      @order.address = @new_address.address
      @order.name = @new_address.name
      @order.postage = POSTAGE
      @order.method_of_payment = @method_of_payment
      @order.billing_amount = @price_on_purchase + POSTAGE
    end
  end

  def new
    @order = Order.new
  end

  def completed
    @cart_products = current_customer.cart_products
    @cart_products.destroy
  end

  def create
    order = Order.new
    order.postal_code = params[:order][:postal_code]
    order.address = params[:order][:address]
    order.name = params[:order][:name]
    order.customer_id = params[:order][:customer_id]
    order.method_of_payment = params[:order][:method_of_payment]
    order.billing_amount = params[:order][:billing_amount]
    order.postage = POSTAGE
    order.save

    shipping_address = ShippingAddress.new
    shipping_address.addressee = params[:order][:name]
    shipping_address.postal_code = params[:order][:postal_code]
    shipping_address.address = params[:order][:address]
    shipping_address.customer_id = params[:order][:customer_id]
    shipping_address.save

    cart_products = current_customer.cart_products
    cart_products.each do |cart_product|
      if cart_product.product.is_active == "now_sale"
        order_product = OrderProduct.new
        order_product.count = cart_product.count
        order_product.price_on_purchase = cart_product.product.non_taxed_price
        order_product.order_id = order.id
        order_product.product_id = cart_product.product.id
        order_product.save
      end
    end

    cart_products.destroy_all
    redirect_to public_orders_completed_path
  end

  def index
    @orders = current_customer.orders
    order_products = OrderProduct.all
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postage, :method_of_payment, :name, :postal_code, :address, :billing_amount)
  end

end
