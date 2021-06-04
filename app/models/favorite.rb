class Favorite < ApplicationRecord

  belongs_to :user
  #belongs_to :performance, counter_cache: :favorites_count
  belongs_to :performance

  validates_uniqueness_of :performance_id, scope: :user_id
end
