class Public::CartProductsController < ApplicationController
  def index
    @products = Product.all
    @product = Product.find(params[:id])
    @cart_product = @product.cart_product
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
  end
end
