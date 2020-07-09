class Customer < ApplicationRecord
	has_many :cart_products, dependent: :destroy
	has_many :orders, dependent: :destroy
	has_many :shipping_addresses, dependent: :destroy
end
