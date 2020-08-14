class OrderProduct < ApplicationRecord
	belongs_to :product, optional: true
	belongs_to :order

	enum production_status: { cannot_be_manufactured: 0, awaiting_production: 1, in_production: 2, production_completed: 3 }
end
