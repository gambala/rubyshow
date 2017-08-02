# frozen_string_literal: true

class AddUrlToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :url, :string
  end
end
