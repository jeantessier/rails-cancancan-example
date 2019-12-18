class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    authorize! :index, @project
  end
end
