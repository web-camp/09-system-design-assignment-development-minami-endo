class Product < ApplicationRecord

	belongs_to :genre, optional: true
	attachment :image
	has_many :order_products, dependent: :destroy
	has_many :cart_products, dependent: :destroy

	enum is_active: { now_sale: true, sold_out: false }

	def Product.search(search)
      if search
        Product.where(['name LIKE ?', "%#{search}%"])
      else
        Product.all
      end
    end

end
