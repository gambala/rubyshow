class PagesController < ApplicationController
  def home
    @courses_number = Course.count
    @comments_number = Comment.count
    @random_course = Course.all.sample
    @random_comment = Comment.all.sample
  end
end
