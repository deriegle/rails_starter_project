class User < ApplicationRecord
  has_secure_password

  validates :name, :length => { :minimum => 5 }
  validates :password, :length => { :minimum => 6 }
end
