class PerformsTag

  belongs_to :performance,foreign_key: true
  belongs_to :tag, foreign_key: true

  include ActiveModel::Model
  attr_accessor :title,
                :explain,
                :start_date,
                :finish_date, 
                :video, 
                :time_table, 
                :price, :place, 
                :staff, :player, 
                :staff, 
                :writer, 
                :directer, 
                :audience, 
                :rest, 
                :other_notice, 
                :play_hour, 
                :play_minutes, 
                :name

  with_options presence: true do
    validates :title
    validates :explain
    validates :start_date
    validates :finish_date 
    validates :video
    validates :time_table 
    validates :price 
    validates :place 
    validates :staff 
    validates :player 
    validates :staff 
    validates :writer 
    validates :directer 
    validates :audience
    validates :rest
    validates :other_notice 
    validates :play_hour
    validates :play_minutes
    validates :name
  end

end