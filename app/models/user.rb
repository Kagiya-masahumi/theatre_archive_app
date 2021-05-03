class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        validates :nickname, presence: true
        validates :name, presence: true
        validates :family_name, presence: true

        has_many :comments, dependent: :destroy
        has_one_attached :image
        #belongs_to :group

end
