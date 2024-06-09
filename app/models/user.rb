class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'Password is invalid. Include both letters and numbers'

         validates :nickname, uniqueness: true, presence: true
         validates :password, presence: true
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/  }
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/  }
         validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :birthday, presence: true
end
