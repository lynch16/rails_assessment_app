class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @users = User.all
    @workshops = Workshop.all
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || user_path(current_user) || root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
