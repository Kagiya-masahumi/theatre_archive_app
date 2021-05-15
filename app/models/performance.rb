class Performance < ApplicationRecord
  def thumbnail input
    return self.images[input].variant(resize: '300x300!').processed
  end
  
  with_options presence: true do
    validates :title
    validates :staff
    validates :image
    validates :price
    validates :rest
    validates :explain
    validates :writer
    validates :audience
  end

  mount_uploader :video, VideoUploader

  has_many :comments
  has_one :company
  belongs_to :group
  has_one_attached :image
end
