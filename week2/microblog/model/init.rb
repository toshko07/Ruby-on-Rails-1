#!/usr/bin ruby

require 'sqlite3'

# remove sqlite file
if File.exists? "blog.sqlite"
    File.delete("blog.sqlite")
end

db = SQLite3::Database.open('blog.sqlite')

# Create table if it does not exist.
db.execute <<SQL
    CREATE TABLE posts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title VARCHAR(255),
        body TEXT,
        timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
    );
SQL
