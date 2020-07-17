class Public::ProductsController < ApplicationController
  def top
  	@genres = Genre.all
  	@products = Product.all
  end

  def genre_search
    @genre = Genre.find(params[:id])
    @products = @genre.products
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
