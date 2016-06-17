class Product < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :name, :category, :price, :url, :photo, :description, presence: {message: "Field is required"}
  mount_uploader :photo, PhotoUploader
end
