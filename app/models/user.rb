class User < ActiveRecord::Base
  has_secure_password
  has_many :drawings
  has_many :descriptions

  validates :username, presence: true, uniqueness: true, length: {minimum: 4, maximum: 14}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password_digest, confirmation: true, presence: true, length: {minimum: 7, maximum: 14}
end
