class User < ActiveRecord::Base

  validates :username, presence: true, length: {maximum: 20}, uniqueness: true
  validates :email, presence: true, length: {maximum: 50}, uniqueness: true

  has_secure_password

end