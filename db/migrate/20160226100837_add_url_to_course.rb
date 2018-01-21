# frozen_string_literal: true

class AddUrlToCourse < ActiveRecord::Migration[4.2]
  def change
    add_column :courses, :url, :string
  end
end
