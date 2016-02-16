class AddCourseIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :course_id, :integer
    add_index :comments, :course_id
  end
end
