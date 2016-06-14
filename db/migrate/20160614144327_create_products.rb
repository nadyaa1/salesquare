class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :brand
      t.string :gender
      t.integer :price
      t.integer :average_rating

      t.timestamps null: false
    end
  end
end
