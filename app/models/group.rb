class Group < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        def thumbnail input
          return self.images[input].variant(resize: '300x300!').processed
        end

        with_options presence: true do
          validates :name
          validates :chair_person
          validates :image
        end
        validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は6文字以上かつ英数字をそれぞれ含めてください" }

        has_many :performances, dependent: :destroy
        has_one_attached :image
        
        
end
