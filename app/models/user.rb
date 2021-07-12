class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email,           uniqueness: { case_sensitive: false }
  validates :password,        format: {with: VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
  validates :nickname,        presence: true
  validates :first_name,      presence: true, format: {with: /\A[一-龥]+\z/}
  validates :last_name,       presence: true, format: {with: /\A[一-龥]+\z/}
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_kana,  presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :birth_date,      presence: true
end
