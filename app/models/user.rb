class User < ApplicationRecord
  validates :name, length: { minimum: 5 }
  has_secure_password
end
