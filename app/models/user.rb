class User < ActiveRecord::Base
  has_many :trips, dependent: :destroy
  has_secure_password
  
  validates :profile_pic, :username, :bio, presence: true
  validates :username, uniqueness: true
end
