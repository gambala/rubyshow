class RemoveKindFromComments < ActiveRecord::Migration[8.0]
  def change
    remove_index :comments, :kind
    remove_column :comments, :kind, :integer, null: false, default: 1
  end
end
