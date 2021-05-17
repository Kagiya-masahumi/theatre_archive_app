class Performance < ApplicationRecord
  def thumbnail input
    return self.images[input].variant(resize: '300x300!').processed
  end
  
  with_options presence: true do
    validates :title
    validates :price
    validates :explain
    validates :start_date
    validates :finish_date
    validates :time_table

  end

  mount_uploader :video, VideoUploader

  has_many :comments
  has_one :company
  belongs_to :group
  has_one_attached :image
end
