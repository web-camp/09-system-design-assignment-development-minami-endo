class Product < ApplicationRecord

	belongs_to :genre, optional: true
	attachment :image
	has_many :order_products, dependent: :destroy
	has_many :cart_products, dependent: :destroy
end
