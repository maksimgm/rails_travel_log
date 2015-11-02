class User < ActiveRecord::Base
  has_many :trips
  
  has_secure_password
  
  validates :username, presence: true
  validates :bio, presence: true
  validates :profile_pic, presence: true
  validates :username, uniqueness: true
end
