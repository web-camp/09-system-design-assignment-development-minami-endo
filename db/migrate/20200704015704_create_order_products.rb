class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :order_id
      t.integer :products_id
      t.integer :count
      t.integer :price_on_purchase
      t.integer :production_status

      t.timestamps
    end
  end
end
