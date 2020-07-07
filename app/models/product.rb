class Product < ApplicationRecord

	belongs_to :genre, optional: true
	attachment :image
end
