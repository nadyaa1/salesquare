class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :products

         has_many :reviews

         has_many :wishlists
         has_many :wishlist_products, through: :wishlists


  mount_uploader :photo, PhotoUploader
end
