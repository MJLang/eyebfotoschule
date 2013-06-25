class User < ActiveRecord::Base
  rolify
  has_secure_password

  before_create :generate_token

  def generate_token
    self.auth_token = SecureRandom.urlsafe_base64
  end


end
