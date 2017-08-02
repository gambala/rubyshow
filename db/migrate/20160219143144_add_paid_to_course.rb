# frozen_string_literal: true

class AddPaidToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :paid, :boolean, default: false
  end
end
