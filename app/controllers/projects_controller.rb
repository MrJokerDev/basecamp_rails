class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all                                                                                     
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    @project.user_id = current_user.id
    if @project.save
      redirect_to projects_path, notice: 'Project in successfully create'
    else
      flash.now[:alert] = 'Invalid create Project'
      render :new
    end
  end

  def edit 
    @project = Project.find_by id: params[:id]
  end

  def update
    @project = Project.find_by id: params[:id]
    if @project.update project_params
      redirect_to projects_path, notice: 'Project in successfully update' 
    else
      flash.now[:alert] = 'Invalid update Project'
      render :edit
    end
  end

  def show
    @project = Project.find_by id: params[:id]
  end

  def destroy
    @project = Project.find_by id: params[:id]
    if @project.delete
      redirect_to projects_path, notice: 'Project in successfully destroy'
    else
      flash.now[:alert] = 'Invalid delete Project'
      render :index
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :body)
  end
  
end
