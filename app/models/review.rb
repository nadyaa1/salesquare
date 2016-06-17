class Review < ActiveRecord::Base
  belongs_to :product

  validates :rating, numericality: { only_integer: true}
  validates :rating, inclusion: { in: [0,1,2,3,4,5], allow_nil: false, message: "please select the value between 1 and 5" }
end
