def sign_in(user, options={})
  if options[:no_capybara]
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
  else
    visit login_path
    fill_in "Name",    with: user.name
    fill_in "Password", with: user.password
    click_button "signin"
  end
end