class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_cart_product

  def current_cart_product
    if session[:cart_product_id]
      @cart_product = CartProduct.find(session[:cart_product_id])
    else
      @cart_product = CartProduct.create
      session[:cart_product_id] = @cart_product.id
    end
  end
end
