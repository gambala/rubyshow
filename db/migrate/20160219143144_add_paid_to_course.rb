# frozen_string_literal: true

class AddPaidToCourse < ActiveRecord::Migration[4.2]
  def change
    add_column :courses, :paid, :boolean, default: false
  end
end
