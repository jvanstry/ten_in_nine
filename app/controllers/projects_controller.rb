class ProjectsController < ApplicationController

  def destroy
    if current_user
      Project.find(params[:id]).destroy
      flash.now[:project_deleted] = 'project successfully deleted'
      redirect_to current_user
    else
      flash.now[:hacker] = "dont hack me bro"
      render root_path
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
  end

  def create
  end

  private
    def verify_admin
      unless User.find_by_token(token)
        flash.now[:hacker] = "dont hack me bro"
        render root_path
      end
    end
end
