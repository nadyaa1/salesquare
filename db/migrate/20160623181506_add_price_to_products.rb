class AddPriceToProducts < ActiveRecord::Migration
  def change
    add_monetize :products, :price, currency: { present: false }
    # add_monetize :products, :optional_price, amount: { null: true, default: nil }
  end
end
