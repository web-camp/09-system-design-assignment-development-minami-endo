class Public::ShippingAddressesController < ApplicationController
  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.all
  end

  def create
    @shipping_address = ShippingAddress.new(public_shipping_address_params)
    @shipping_address.save
    redirect_to public_shipping_addresses_index_path
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.update(public_shipping_address_params)
    redirect_to public_shipping_addresses_index_path
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    redirect_to public_shipping_addresses_index_path
  end

  private
    def public_shipping_address_params
      params.require(:shipping_address).permit(:postal_code, :address, :addressee, :customer_id)
    end
end

