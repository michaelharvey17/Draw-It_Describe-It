class User < ActiveRecord::Base
  has_secure_password
  has_many :drawings
  has_many :descriptions
  
  validates :password, confirmation: true
  validates_uniqueness_of :username
  validates_presence_of :username
  validates :username, length: {minimum: 4, maximum: 14}
  validates :password_digest, confirmation: true, presence: true
end
