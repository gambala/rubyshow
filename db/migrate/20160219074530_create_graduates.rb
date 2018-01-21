# frozen_string_literal: true

class CreateGraduates < ActiveRecord::Migration[4.2]
  def change
    create_table :graduates do |t|
      t.boolean :finished
      t.integer :course_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :graduates, :course_id
    add_index :graduates, :user_id
  end
end
