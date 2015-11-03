class User < ActiveRecord::Base
  has_many :trips, dependent: :destroy
  
  has_secure_password
    
  validates :profile_pic, :username, :bio, :email, presence: true
  validates :username, uniqueness: true

  def generate_password_reset_token!
    update(password_reset_token: SecureRandom.urlsafe_base64(48))
  end
end
