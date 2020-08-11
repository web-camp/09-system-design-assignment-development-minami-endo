class ShippingAddress < ApplicationRecord
	belongs_to :customer, optional: true
	def address_info
		[postal_code, addressee, address].join(" ")
	end
end
