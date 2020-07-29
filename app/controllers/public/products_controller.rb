class Public::ProductsController < ApplicationController
  def top
  	@genres = Genre.all
  	@products = Product.all
    @products = Product.page(params[:page]).per(4)
  end

  def index
    @genres = Genre.all

  	@products = Product.all
    @product_count = Product.count
  end

  def show
    @genres = Genre.all
  	@product = Product.find(params[:id])
  	@cart_product = CartProduct.new
  end
end
