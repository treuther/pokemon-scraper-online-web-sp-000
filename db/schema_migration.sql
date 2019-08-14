-- Write your sql commands to create your db schema here.
-- It should create a table in a new table in the db/ directory.

def self.create_table
  sql = <<-SQL
    CREATE TABLE IF NOT EXIST pokemon (
      id INTEGER PRIMARY KEY,
      name TEXT,
      type TEXT,
    )
  SQL
  
end