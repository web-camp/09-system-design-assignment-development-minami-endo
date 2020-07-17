class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    public_root_path
  end

  def application
  	@customer = current_customer
  end
end
