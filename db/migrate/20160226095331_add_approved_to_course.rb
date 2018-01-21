# frozen_string_literal: true

class AddApprovedToCourse < ActiveRecord::Migration[4.2]
  def change
    add_column :courses, :approved, :boolean, default: false, null: false
  end
end
