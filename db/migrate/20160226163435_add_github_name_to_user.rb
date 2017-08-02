# frozen_string_literal: true

class AddGithubNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :github_name, :string
  end
end
