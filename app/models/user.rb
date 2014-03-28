class User < ActiveRecord::Base
  include SecureRandom

  has_secure_password
  before_save { self.token = create_hash}

   
  def generate_token
    SecureRandom.urlsafe_base64
  end

  def digest(token)
    Digest::SHA1::hexdigest(token.to_s)
  end

  def create_hash
    digest(generate_token)
  end
end

