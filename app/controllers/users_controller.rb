class UsersController < ApplicationController  
  def show 
    @projects =  Project.all
  end
end