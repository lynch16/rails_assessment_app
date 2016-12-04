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

  private
  def is_officer?
    unless current_user.admin? || @workshop.try(:officer) == current_user
      redirect_to root_path, alert: "You are not allowed to access that page."
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
