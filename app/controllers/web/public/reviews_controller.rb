# frozen_string_literal: true

class Web::Public::Review < Comment
end

class Web::Public::ReviewPolicy < ApplicationPolicy
  def index?; true end
end

module Web::Public
  class ReviewsController < Web::Public::ApplicationController
    include WithPagy

    def index
      @comments = Web::Public::Review.includes(:course, :user).order(created_at: :desc)
      authorize @comments
      @comments = paginate(@comments, items: 6)
    end
  end
end
