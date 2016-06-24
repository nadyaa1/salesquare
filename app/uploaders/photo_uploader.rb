# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :standard do
    resize_to_fit 800, 600
  end

  version :bright_face do
    cloudinary_transformation width: 300, height: 200, crop: :thumb, gravity: :face
  end

  version :product_show do
    cloudinary_transformation width: 400, height: 400, crop: :thumb, gravity: :face
  end

  version :wishlist do
    cloudinary_transformation width: 150, crop: :fill
  end
end
