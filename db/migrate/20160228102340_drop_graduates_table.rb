class DropGraduatesTable < ActiveRecord::Migration[4.2]
  def up
    drop_table :graduates
  end

  def down
    create_table :graduates do |t|
      t.boolean :finished
      t.integer :course_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
