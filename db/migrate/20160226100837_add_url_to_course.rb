class AddUrlToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :url, :string
  end
end
