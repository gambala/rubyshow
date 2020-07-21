class RedirectsController < ActionController::Base
  def reviews
    redirect_to [:public, :reviews]
  end
end
