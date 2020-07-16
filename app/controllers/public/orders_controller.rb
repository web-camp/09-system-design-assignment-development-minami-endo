class Public::OrdersController < ApplicationController
  def comfirm
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

    if params[:order][:select_address] == "ご自身の住所"
      @postal_code = current_customer.postal_code
      @address = current_customer.address
      @first_name = current_customer.first_name
      @last_name = current_customer.last_name
    elsif params[:order][:select_address] == "登録済住所から選択"
      @select_address = ShippingAddress.find(params[:order][:shipping_address_id])
      @address = @select_address.address_info
    elsif params[:order][:select_address] == "新しいお届け先"
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
    @order = Order.new(order_params)
    @order.save
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:method_of_payment, :name, :postal_code, :address)
  end
end
