class Tag < ApplicationRecord
  
  has_many :perform_tags
  has_many :performances, through: :perform_tags

end
