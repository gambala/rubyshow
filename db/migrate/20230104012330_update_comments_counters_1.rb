class UpdateCommentsCounters1 < ActiveRecord::Migration[6.1]
  def up
    Comment.counter_culture_fix_counts
  end

  def down; end
end
