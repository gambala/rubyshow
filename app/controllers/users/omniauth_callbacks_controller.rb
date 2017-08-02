# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def github
      @user = current_user || User.from_omniauth(oauth_data)

      if current_user
        current_user.update_omniauth_data oauth_data
        redirect_to :back
      elsif @user.persisted?
        # this will throw if @user is not activated
        sign_in_and_redirect @user, event: :authentication

        set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
      else
        session['devise.github_data'] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end

    def failure
      redirect_to root_path
    end

    private

    def oauth_data
      request.env['omniauth.auth']
    end
  end
end
