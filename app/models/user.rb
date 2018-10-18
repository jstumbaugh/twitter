class User < ApplicationRecord
  has_secure_password

  validates :username, :password, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 8 }

  has_many :likes
end
