class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.string :image_id
      t.text :caption
      t.integer :non_taxed_price
      t.boolean :is_active

      t.timestamps
    end
  end
end
