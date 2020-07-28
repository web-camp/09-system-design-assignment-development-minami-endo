class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_top_path
    when Customer
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when Admin
      new_admin_session_path
    when Customer
      new_customer_session_path
    end
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
