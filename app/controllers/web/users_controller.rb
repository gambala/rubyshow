# frozen_string_literal: true

module Web
  class UsersController < Web::ApplicationController
    def show
      @user = User.includes(:comments).find(params[:id])
      @comments = @user.comments
    end
  end
end
