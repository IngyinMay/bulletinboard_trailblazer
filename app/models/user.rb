class User < ApplicationRecord
  has_many :post
  has_many :password_remainder
  has_secure_password
end
