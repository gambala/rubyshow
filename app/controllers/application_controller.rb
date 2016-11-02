class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :username, :email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
  end

  private

  def user_not_authorized
    flash[:alert] = 'У вас недостаточно прав для выполнения этого действия.'
    redirect_to(request.referrer || root_path)
  end
end
