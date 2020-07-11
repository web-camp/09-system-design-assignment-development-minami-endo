class Public::ProductsController < ApplicationController
  def top
  	@genres = Genre.all
  	@products = Product.all
  end

  def index
    @genres = Genre.all
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  	@cart_product = CartProduct.new
  end
end
