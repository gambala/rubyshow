# frozen_string_literal: true

class AddGraduateToComment < ActiveRecord::Migration[4.2]
  def change
    add_column :comments, :graduate, :boolean, default: false
  end
end
