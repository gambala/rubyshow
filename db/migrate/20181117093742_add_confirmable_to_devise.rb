class AddConfirmableToDevise < ActiveRecord::Migration[5.2]
  # Note: You can't use change, as User.update_all will fail in the down migration
  def up
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_index :users, :confirmation_token, unique: true
    if ActiveRecord::Base.connection.adapter_name == 'PostgreSQL'
      execute("UPDATE users SET confirmed_at = NOW()")
    elsif ActiveRecord::Base.connection.adapter_name == 'SQLite'
      execute("UPDATE users SET confirmed_at = CURRENT_TIMESTAMP")
    end
  end

  def down
    remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at
  end
end
