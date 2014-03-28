class ProjectsController < ApplicationController

  def destroy
    HackStopper.verify_admin(cookies[:token])

    Project.find(params[:id]).destroy

    flash.now[:project_deleted] = 'project successfully deleted'
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
