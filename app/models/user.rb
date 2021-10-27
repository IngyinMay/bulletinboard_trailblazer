class User < ApplicationRecord
  has_secure_password
  mount_uploader :profile, ProfileUploader
end
