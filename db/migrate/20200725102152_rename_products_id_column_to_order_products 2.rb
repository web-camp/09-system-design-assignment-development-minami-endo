class RenameProductsIdColumnToOrderProducts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :order_products, :products_id, :product_id
  end
end
