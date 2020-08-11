class ChangeIsActiveOfProducts < ActiveRecord::Migration[5.2]
  def change
  	change_column :products, :is_active, :boolean, default: true
  end
end
