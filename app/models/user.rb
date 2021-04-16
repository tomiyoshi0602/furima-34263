class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Input half-width characters.' }
  with_options presence: true do
    validates :nickname, :birthday
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'is invalid. Input full-width characters.' }
    validates :last_name_reading, :first_name_reading,
              format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
  end
end
