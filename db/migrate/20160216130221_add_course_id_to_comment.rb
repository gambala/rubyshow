# frozen_string_literal: true

class AddCourseIdToComment < ActiveRecord::Migration[4.2]
  def change
    add_column :comments, :course_id, :integer
    add_index :comments, :course_id
  end
end
