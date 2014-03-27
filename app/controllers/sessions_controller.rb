class SessionsController < ApplicationController
  def create
    user = User.find_by_name(params[:session][:name])

    if user && user.authenticate(params[:session][:password])
      cookies.permanent[:token] = user.token
      redirect_to user
    else
      flash.now[:signin] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def new
  end

  def destroy
  end
end
