# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(username email password password_confirmation remember_me))
    devise_parameter_sanitizer.permit(:sign_in, keys: %i(login username email password remember_me))
    devise_parameter_sanitizer.permit(:account_update, keys: %i(username email password password_confirmation current_password))
  end

  def user_not_authorized
    flash[:alert] = 'У вас недостаточно прав для выполнения этого действия.'
    redirect_to(request.referer || root_path)
  end
end
