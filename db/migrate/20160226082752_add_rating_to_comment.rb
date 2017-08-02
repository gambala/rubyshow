# frozen_string_literal: true

class AddRatingToComment < ActiveRecord::Migration
  def change
    add_column :comments, :rating, :integer
    add_index :comments, :rating
  end
end
