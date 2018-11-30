class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
  	gyms_path
  end

  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
