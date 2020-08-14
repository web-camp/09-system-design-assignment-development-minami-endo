class ChangeProductionStatusOfOrderProducts < ActiveRecord::Migration[5.2]
  def change
  	change_column :order_products, :production_status, :integer, default: 0
  end
end
