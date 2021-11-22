class User < ApplicationRecord
  has_many :post
  has_many :password_remainder
  has_secure_password

  # remove comment for rspec user model test
  # validates :name, presence: true, length: { maximum: 100 }
  # validates :email, presence: true, length: { maximum: 100 },format: { with: Constants::VALID_EMAIL_REGEX }
  # validates :password, presence: true, confirmation: true
  # validates :password_confirmation, presence: true
  # validates :phone, numericality: true, allow_blank: true, length: { minimum: 10, maximum: 13 }
  # validates :address, length: { maximum: 255 }, allow_blank: true
  # validates :super_user_flag, presence: true, inclusion: { in: [true, false] }
  # validates :birthday, format: { with: Constants::VALID_DATE_FORMAT }, allow_blank: true
end
