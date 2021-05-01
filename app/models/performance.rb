class Performance < ApplicationRecord

  has_many :comments 
  belongs_to :group
  has_one_attached :image
end
