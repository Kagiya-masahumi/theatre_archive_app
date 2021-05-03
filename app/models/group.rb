class Group < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        def thumbnail input
          return self.images[input].variant(resize: '300x300!').processed
        end

        has_many :performances, dependent: :destroy
        has_one_attached :image
        
end
