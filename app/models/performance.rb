class Performance < ApplicationRecord
  def thumbnail input
    return self.images[input].variant(resize: '300x300!').processed
  end
  mount_uploader :video, CloudinaryImageUploader
  acts_as_taggable
  
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
    validates :director
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
  has_one :performance_order
  belongs_to :group
  has_one_attached :image


  
end
