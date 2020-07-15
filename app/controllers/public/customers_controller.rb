class Public::CustomersController < ApplicationController
  def top
  end
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to public_customer_path
  end

  def unsubscribe
  end

  def withdraw
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_katakana, :last_name_katakana, :email, :phone_number, :address, :postal_code)
  end
end
