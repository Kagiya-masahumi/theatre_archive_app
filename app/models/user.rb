class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        def thumbnail input
          return self.images[input].variant(resize: '300x300!').processed
        end

        validates :nickname, presence: true
        validates :name, presence: true
        validates :family_name, presence: true

        has_many :comments, dependent: :destroy
        has_many :favorites, dependent: :destroy
        has_many :favorite_performances, through: :favorites
        has_one_attached :image
        
        def favorited_by?(performance_id)
          favorites.where(performance_id: performance_id).exists?
        end

        has_many :favorites,foreign_key: "user_id"
        has_many :favorite_performances, through: :performances, source: :performance

end
