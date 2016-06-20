class Wishlist < ActiveRecord::Base
  belongs_to :user
  has_many :wishlist_products, dependent: :destroy
  has_many :products, through: :wishlist_products
end
