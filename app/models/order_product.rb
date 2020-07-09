class OrderProduct < ApplicationRecord
	belongs_to :product, optional: true
	belongs_to :order
end
