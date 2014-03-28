class User < ActiveRecord::Base
  include SecureRandom

  has_secure_password
  before_save { self.token = create_hash}

  def create_hash
    token = SecureRandom.urlsafe_base64
    Digest::SHA1::hexdigest(token.to_s)
  end
end

