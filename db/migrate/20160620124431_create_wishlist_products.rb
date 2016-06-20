class CreateWishlistProducts < ActiveRecord::Migration
  def change
    create_table :wishlist_products do |t|
      t.references :product, index: true, foreign_key: true
      t.references :wishlist, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
