class AddStringToGenre < ActiveRecord::Migration[5.2]
  def change
  	change_column :genre ,:name,:string
  end
end
