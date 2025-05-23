class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include WithFrameContainerTag
  include WithMobileViews
  include WithSeo

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_for_mobile
  before_action :use_container, only: %i[index new create show edit update mini]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  helper_method :mimic_user

  private

  def mimic_user
    return if current_user.blank?
    return current_user unless ::Pundit.policy(current_user, ::MimicUser).index?
    return nil if params[:mimic_user_id] == "guest"
    User.find_by(id: params[:mimic_user_id].to_i).presence || current_user
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email password password_confirmation remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[login username email password remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username email password password_confirmation current_password])
  end

  # Turbo doesn't redirect user to root_path after sign out properly,
  # Rails renders the root page with no layout. This method fixes it.
  def after_sign_out_path_for(resource_or_scope)
    root_path(format: :html)
  end

  def user_not_authorized
    flash[:alert] = "У вас недостаточно прав для выполнения этого действия."
    redirect_to(request.referrer || root_path)
  end
end
