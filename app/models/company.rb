class Company < ApplicationRecord
  
  with_options presence: true do
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
    
  end

  belongs_to :performance, optional:true
end
