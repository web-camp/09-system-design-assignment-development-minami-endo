class Order < ApplicationRecord
	enum method_of_payment:[:クレジットカード, :銀行振込]
end
