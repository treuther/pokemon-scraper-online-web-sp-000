class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @id = id
    @db = db
  end
  
  def self.save(name, type)
    if self.id
      self.update
    else
      sql = <<-SQL
        INSERT INTO pokemon (name, type, id)
        VALUES (?, ?)
        SQL
      
      DB[:conn].execute(sql, self.name, self.type, self.id)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end
  end
  
  def update
    sql = "UPDATE pokemon SET name = ?, type = ?, WHERE id = ?"
    
    DB[:conn].execute(sql, self.name, self.type, self.id)
  end
  
end
