class Genre < ApplicationRecord

	has_many :products, dependent: :destroy
	accepts_nested_attributes_for :products
    enum is_active: { effectiveness: true, unavailable: false }
end
