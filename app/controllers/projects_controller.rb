class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    authorize! :index, @project
  end

  def new
    @project = Project.new
    authorize! :new, @project
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = 'Project was saved!'
      redirect_to root_path
    else
      render 'new'
    end
    authorize! :create, @project
  end

  def edit
    @project = Project.find(params[:id])
    authorize! :edit, @project
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = 'Project was updated!'
      redirect_to root_path
    else
      render 'edit'
    end
    authorize! :update, @project
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:success] = 'Project was destroyed!'
    else
      flash[:warning] = 'Cannot destroy this project...'
    end
    redirect_to root_path
    authorize! :destroy, @project
  end

  private

  def project_params
    params.require(:project).permit(:title)
  end
end
