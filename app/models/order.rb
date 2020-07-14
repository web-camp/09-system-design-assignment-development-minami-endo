class Order < ApplicationRecord
	enum method_of_payment:[:クレジットカード, :銀行振込]
	enum select_address:[:ご自身の住所, :登録済住所から選択, :新しいお届け先]
end
