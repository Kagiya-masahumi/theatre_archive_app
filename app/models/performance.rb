class Performance < ApplicationRecord
  def thumbnail input
    return self.images[input].variant(resize: '300x300!').processed
  end
  

  validates :price, presence: true
  mount_uploader :video, VideoUploader

  has_many :comments 
  belongs_to :group
  has_one_attached :image
end
