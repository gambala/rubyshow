class AddKindToComment < ActiveRecord::Migration
  def change
    add_column :comments, :kind, :integer, null: false, default: 1
    add_index :comments, :kind
  end
end
