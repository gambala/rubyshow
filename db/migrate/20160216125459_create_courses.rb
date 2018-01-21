# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[4.2]
  def change
    create_table :courses do |t|
      t.string :title, null: false, default: ''
      t.text :description, null: false, default: ''
      t.string :language, null: false, default: 'Русский'

      t.timestamps null: false
    end
    add_index :courses, :title, unique: true
  end
end
