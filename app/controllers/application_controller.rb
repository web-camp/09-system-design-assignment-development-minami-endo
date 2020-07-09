class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	helper_method :current_cart

  def current_cart
    if session[:customer_id]
      @customer = Customer.find(session[:customer_id])
    else
      @customer = Customer.create
      session[:customer_id] = @customer.id
    end
  end
end
