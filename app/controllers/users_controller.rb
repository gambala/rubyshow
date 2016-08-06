class UsersController < ApplicationController
  def show
    @user = User.includes(:comments).find(params[:id])
    @comments = @user.comments
  end
end
