class ShippingAddress < ApplicationRecord
	belongs_to :customer, optional: true
end
