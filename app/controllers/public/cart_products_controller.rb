class Public::CartProductsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_products = CartProduct.all
    @cart_products = current_customer.cart_products
    @total_price = 0
    @cart_products.each do |cart_product|
      if cart_product.product.is_active == "now_sale"
        @total_price += cart_product.product.non_taxed_price * cart_product.count * 1.1
      end
    end
  end

  def update
    cart_product = CartProduct.find(params[:id])
    cart_product.update(cart_product_params)
    redirect_to public_cart_products_path
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to public_cart_products_path
  end

  def destroy_all
    @cart_products = current_customer.cart_products
    @cart_products.destroy_all
    redirect_to public_products_path
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.customer_id = current_customer.id
    if @cart_product.product.is_active == "now_sale"
      if CartProduct.find_by(customer_id: current_customer.id, product_id: @cart_product.product_id)
        @existing_cart_product = CartProduct.find_by(customer_id: current_customer.id, product_id: @cart_product.product_id)
        @existing_cart_product.count += @cart_product.count
        @existing_cart_product.save
        redirect_to public_cart_products_path
      else
      @cart_product.save
      redirect_to public_cart_products_path
      end
    end
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:count, :product_id)
  end
end
