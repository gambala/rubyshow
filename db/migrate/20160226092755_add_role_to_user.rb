# frozen_string_literal: true

class AddRoleToUser < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :role, :string, default: 'user', null: false
  end
end
