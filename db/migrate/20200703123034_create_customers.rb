class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :first_name_katakana
      t.string :last_name_katakana
      t.string :email
      t.string :password
      t.string :phone_number
      t.string :address
      t.string :postal_code
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
