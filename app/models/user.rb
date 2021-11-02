class User < ApplicationRecord
  has_many :post
  has_secure_password
  mount_uploader :profile, ProfileUploader
end
