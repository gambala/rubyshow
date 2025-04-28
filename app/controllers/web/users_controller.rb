module Web
  class UsersController < Web::ApplicationController
    def show
      @user = User.includes(comments: :course).find(params[:id])
      @comments = @user.comments
    end
  end
end
