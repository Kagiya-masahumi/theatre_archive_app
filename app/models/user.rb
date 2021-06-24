class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        def thumbnail input
          return self.images[input].variant(resize: '300x300!').processed
        end

        validates :nickname, presence: true
        validates :password,
          format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は6文字以上かつ英数字をそれぞれ含めてください" }
        with_options presence: true, format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: 'に全角文字を使用してください' } do
          validates :family_name
          validates :name
        end

        has_many :comments, dependent: :destroy
        has_many :favorites, dependent: :destroy
        has_many :favorite_performances, through: :favorites
        has_one_attached :image
        
        def favorited_by?(performance_id)
          favorites.where(performance_id: performance_id).exists?
        end

        has_many :favorites,foreign_key: "user_id"
        has_many :favorite_performances, through: :performances, source: :performance

        has_one :card, dependent: :destroy

end
