class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    token = cookies[:token]
    @current_user ||= token && User.find_by(token: token)
  end

  def current_user= (user)
    @current_user = user
  end
end
