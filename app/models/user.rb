class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  mount_uploader :image, ImageUploader

  has_secure_password

  has_many :posts
end
