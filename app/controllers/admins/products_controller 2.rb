class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.all
    @products_search = Product.search(params[:search])
  end

  def top
    @orders = Order.all
    @today_order = 0
    @orders.each do |order|
      if order[:created_at].to_s.match(/#{Date.today.to_s}.+/)
        @today_order += 1
      end
    end
  end

  def new
    @product = Product.new
    @product.build_genre
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admins_product_path(@product)
  end

  def show
    @product = Product.find(params[:id])
    @genre = @product.genre
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admins_products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :caption, :non_taxed_price, :image, :is_active, :genre_id)
  end

end
