class Product < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :name, :category, :price, :url, :photo, :description, presence: {message: "Field is required"}
  mount_uploader :photo, PhotoUploader

  monetize :price_cents
  # monetize :optional_price_cents, :allow_nil => true

  include PgSearch
  pg_search_scope :search, against: [ :name, :description, :category ]
end
