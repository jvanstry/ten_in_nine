class UsersController < ApplicationController
  include HackStopper
  
  def show
    HackStopper.verify_admin(cookies[:token])
    @projects =  Project.all
  end
end