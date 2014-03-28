class SessionsController < ApplicationController
  def create
    user = User.find_by_name(params[:session][:name])

    if user && user.authenticate(params[:session][:password])
      user.update_attributes(token: user.create_hash)
      cookies.permanent[:token] = user.token

      redirect_to user_path user
    else
      flash.now[:signin] = 'try again'
      render 'new'
    end
  end

  def new
    user = User.find_by_token(cookies[:token])
    redirect_to user if user
  end

  def destroy
    current_user = nil
    cookies[:token] = nil
    redirect_to root_path
  end
end
