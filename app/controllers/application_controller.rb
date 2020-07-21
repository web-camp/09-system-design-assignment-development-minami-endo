class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    root_path
  end

  def application
  	@customer = current_customer
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_katakana, :last_name_katakana, :postal_code, :phone_number, :address])
    end
end
