class AddGraduatesCountToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :graduates_count, :integer, null: false, default: 0
  end
end
