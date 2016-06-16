class Product < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
<<<<<<< HEAD

  mount_uploader :photo, PhotoUploader
=======
  belongs_to :user
>>>>>>> 80b3884491f8b03bbc17dbfad793d2dfca3cc2c1
end
