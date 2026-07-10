class User < ApplicationRecord
  has_secure_password
  has_one_attached :photo

  has_many :posts

  validates :email, presence: true, uniqueness: true
end
