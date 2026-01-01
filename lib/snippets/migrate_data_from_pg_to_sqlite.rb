require "pg"
require "sqlite3"

# PostgreSQL connection
pg_conn = PG.connect(host: ENV["DB_HOST"], port: ENV["DB_PORT"], dbname: ENV["POSTGRES_DB"], user: ENV["POSTGRES_USER"], password: ENV["POSTGRES_PASSWORD"])

# SQLite connection
sqlite_db = SQLite3::Database.new ENV["SQLITE_DB"]

# Define your tables and columns here
tables = {
  "users" => ["id", "email", "encrypted_password", "reset_password_token", "reset_password_sent_at", "remember_created_at", "sign_in_count", "current_sign_in_at", "last_sign_in_at", "current_sign_in_ip", "last_sign_in_ip", "created_at", "updated_at", "role", "provider", "uid", "username", "github_name", "confirmation_token", "confirmed_at", "confirmation_sent_at"],
  "comments" => ["id", "user_id", "content", "created_at", "updated_at", "course_id", "rating", "graduate"],
  "courses" => ["id", "title", "description", "language", "created_at", "updated_at", "paid", "approved", "url", "graduates_count"]
}

tables.each do |table, columns|
  pg_conn.exec("SELECT #{columns.join(", ")} FROM #{table}") do |result|
    result.each do |row|
      placeholders = (["?"] * columns.size).join(", ")
      sqlite_db.execute("INSERT INTO #{table} (#{columns.join(", ")}) VALUES (#{placeholders})", row.values)
    end
  end
end

boolean_columns = {
  "courses" => ["paid", "approved"],
  "comments" => ["graduate"]
}

boolean_columns.each do |table, columns|
  columns.each do |column|
    sqlite_db.execute("UPDATE #{table} SET #{column} = 1 WHERE #{column} = 't'")
    sqlite_db.execute("UPDATE #{table} SET #{column} = 0 WHERE #{column} = 'f'")
  end
end

pg_conn.close
sqlite_db.close
