class CartProduct < ApplicationRecord
    belongs_to :product, optional: true
    belongs_to :customer, optional: true
end
