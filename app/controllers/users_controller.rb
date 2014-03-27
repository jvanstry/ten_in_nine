class UsersController < ApplicationController
  def show
    user = User.find_by session[:token]
  end
end
