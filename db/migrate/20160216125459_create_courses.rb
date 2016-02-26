class CreateCourses < ActiveRecord::Migration
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
