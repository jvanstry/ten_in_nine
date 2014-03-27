class ProjectsController < ApplicationController
  include HackStopper

  def destroy
    HackStopper.verify_admin(cookies[:token])

    Project.find(params[:id]).destroy

    flash.now[:project_deleted] = 'project successfully deleted'
  end
end
