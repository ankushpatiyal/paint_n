class AddMultipleFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.string :phone
      t.string :country
      t.string :city
      t.string :name
      t.text :about      
    end
  end
end
