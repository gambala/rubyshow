# frozen_string_literal: true

namespace :comments do
  desc 'Set types to existing comments'
  task set_kind: :environment do
    Comment.all.each do |comment|
      if comment.graduate?
        comment.update(kind: Comment.kinds[:opinion])
      else
        comment.update(kind: Comment.kinds[:comment])
      end
    end
  end
end
