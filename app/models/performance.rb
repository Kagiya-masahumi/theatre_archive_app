class Performance < ApplicationRecord
  def thumbnail input
    return self.images[input].variant(resize: '300x300!').processed
  end
  mount_uploader :video, VideoUploader

  with_options presence: true do
    validates :title
    validates :price
    validates :explain
    validates :start_date
    validates :finish_date
    validates :time_table
    validates :staff
    validates :rest
    validates :writer
    validates :audience
    validates :place
    validates :audience
    validates :rest
    validates :play_hour
    validates :play_minutes
    validates :other_notice
    validates :video
    validates :image
  end

  

  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :favorite_performances, through: :favorites, source: :performance
  has_many :perform_tags,dependent: :destroy
  has_many :tags, through: :perform_tags
  belongs_to :group
  has_one_attached :image

  acts_as_taggable
  
end
