module HackStopper
  def self.verify_admin token
    unless User.find_by_token(token)
      flash.now[:hacker] = "dont hack me bro"
      render root_path
    end
  end
end