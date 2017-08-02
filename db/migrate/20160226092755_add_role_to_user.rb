# frozen_string_literal: true

class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, default: 'user', null: false
  end
end
