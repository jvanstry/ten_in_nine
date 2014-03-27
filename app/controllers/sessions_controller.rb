class SessionsController < ApplicationController
  def create
    user = User.find_by_name(params[:session][:name])

    if user && user.authenticate(params[:session][:password])
      cookies.permanent[:token] = user.token
      redirect_to user_path user
    else
      flash.now[:signin] = 'try again'
      render 'new'
    end
  end

  def new
  end

  def destroy
  end
end
