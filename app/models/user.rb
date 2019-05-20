class User < ApplicationRecord
  has_secure_password

  validates :name, :length => { :minimum => 5 }
end
