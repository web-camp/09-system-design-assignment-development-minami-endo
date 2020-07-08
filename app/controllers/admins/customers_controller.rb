class Admins::CustomersController < ApplicationController
  def index
  	@customers = Customer.all
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	@customer.update(customer_params)
  	redirect_to admins_customer_path(@customer)
  end


  private
  def customer_params
  	params.require(:customer).permit(:first_name, :last_name, :first_name_katakana, :last_name_katakana, :email, :phone_number, :address, :postal_code, :is_deleted)
  end
end
