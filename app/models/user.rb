class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,  :date_of_birth,  presence: true
  validates_format_of :last_name, :first_name, with: /\A[ぁ-んァ-ン一-龥]/, presence: true
  validates_format_of :last_name_kana, :first_name_kana, with: /\A[ァ-ヶー－]+\z/, presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9])/, message: "must contain both letters and numbers" }
end