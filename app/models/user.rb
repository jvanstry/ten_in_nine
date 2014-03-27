class User < ActiveRecord::Base
  include SecureRandom

  has_secure_password
  before_save { self.token = SecureRandom.base64 }
end

