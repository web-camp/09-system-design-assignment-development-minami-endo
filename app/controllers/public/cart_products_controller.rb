class Public::CartProductsController < ApplicationController
  before_action :setup_cart_product!, only: [:create, :update, :destroy, :destroy_all]

  def index
    @products = Product.all
    @product = Product.find(params[:id])
    @cart_product = @product.cart_product
  end

  def update
    @cart_product.update(count: params[:count].to_i)
    redirect_to current_cart_product
  end

  def destroy
    @cart_product.destroy
    redirect_to current_cart_product
  end

  def destroy_all
  end

  def create
    if @cart_product.blank?
      @cart_product = current_cart_product.cart_products.build(product_id: params[:product_id])
    end
    @cart_product.count += params[:count].to_i
    @cart_product.save
    redirect_to current_cart_product
  end

  private
  def setup_cart_product!
    @cart_product = current_cart_product.cart_products.find_by(product_id: params[:product_id])
  end
end
