class Product < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :wishlist_products, dependent: :destroy

  validates :name, :category, :price, :url, :photo, :description, presence: {message: "Field is required"}
  mount_uploader :photo, PhotoUploader

  monetize :price_cents
  # monetize :optional_price_cents, :allow_nil => true

  include PgSearch
  pg_search_scope :search, against: [ :name, :description, :category ]
end
