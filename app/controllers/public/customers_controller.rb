class Public::CustomersController < ApplicationController
  def top
    @genres = Genre.all
    @products = Product.all
    @products = Product.page(params[:page]).per(4)
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
    redirect_to public_customers_my_page_path
  end

  def unsubscribe
    @customer = current_customer
    
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path

  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_katakana, :last_name_katakana, :email, :phone_number, :address, :postal_code, :is_deleted)
  end
end
