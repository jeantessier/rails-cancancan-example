class ApplicationController < ActionController::Base
  private

  def current_user
    User.new(session[:id])
  end

  helper_method :current_user
end
