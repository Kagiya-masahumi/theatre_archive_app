class Company < ApplicationRecord
  \
  with_options presence: true do
    validates :staff
    validates :rest
    validates :writer
    validates :audience
  end

  belongs_to :performance, optional:true
end
