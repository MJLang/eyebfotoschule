class User < ActiveRecord::Base
  rolify
  has_secure_password

  has_many :sent_messages, class_name: "Message", foreign_key: :sender_id
  has_many :received_messages, class_name: "Message", foreign_key: :receiver_id


  before_create :generate_token



  def generate_token
    self.auth_token = SecureRandom.urlsafe_base64
  end


end
