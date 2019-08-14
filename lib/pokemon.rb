require 'pry'
class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  # initialized with keyword arguments, id, name, type and db
  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @id = id
    @db = db
  end
  
  # saves an instance of a pokemon with the correct id
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  # find a pokemon from the database by their id number and returns a new Pokemon object
  def self.find(num, db)
    
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", num).flatten
    
    new_pokemon = self.new(pokemon)
    new_pokemon.id = pokemon[0]
    new_pokemon.name = pokemon[1]
    new_pokemon.type = pokemon[2]
    new_pokemon
  end
  
end
