# frozen_string_literal: true

module Web::Public
  class ReviewsController < Web::Public::ApplicationController
    include WithPagy

    def index
      @comments = Comment.includes(:course, :user).order(created_at: :desc)
      @comments = paginate(@comments, items: 6)
    end
  end
end
