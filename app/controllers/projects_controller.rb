class ProjectsController < ApplicationController

  def destroy
    hacker_please unless current_user
    
    Project.find(params[:id]).destroy
    
    flash.now[:project_deleted] = 'project successfully deleted'
    redirect_to current_user
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    hacker_please unless current_user

    if Project.create(project_params)
      redirect_to current_user
    else
      flash.now[:incomplete] = "name, github, and description required"
      redirect_to new_project_path
    end
  end

  def update
    hacker_please unless current_user

    @project = Project.find(params[:id])
    
    if @project.update_attributes(project_params)
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  private
    def hacker_please
      flash.now[:hacker] = "dont hack me bro"
      render root_path
    end

    def project_params
      params.require(:project).permit(:name, :github_url, :thumbnail_url, :description, :tag_list)
    end
end
