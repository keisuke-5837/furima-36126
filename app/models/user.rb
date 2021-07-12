class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,        format: {with: VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
  validates :nickname,        presence: true
  validates :birth_date,      presence: true

  with_options presence: true do
  validates :first_name,      format: {with: /\A[一-龥]+\z/}
  validates :last_name,       format: {with: /\A[一-龥]+\z/}
  validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_kana,  format: {with: /\A[ァ-ヶー－]+\z/}
  end
end
