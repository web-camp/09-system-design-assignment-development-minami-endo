class Order < ApplicationRecord
	enum method_of_payment:[:クレジットカード, :銀行振込]
	enum select_address:[:ご自身の住所, :登録済住所から選択, :新しいお届け先]
	belongs_to :customer, optional: true
	has_many :order_products, dependent: :destroy
	enum order_status: { wating_for_payment: 0, payment_comfirmation: 1, in_production: 2, preparation_for_shipment: 3, sent: 4 }
end
