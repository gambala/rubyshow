# frozen_string_literal: true

class AddGithubNameToUser < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :github_name, :string
  end
end
