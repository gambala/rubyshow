class CreateComments < ActiveRecord::Migration[4.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :content, null: false, default: ""

      t.timestamps null: false
    end
    add_index :comments, :user_id
  end
end
