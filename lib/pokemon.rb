require 'pry'
class Pokemon
    attr_accessor :id, :name, :type, :db
   
        
    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end 

    def self.save(name, type, db) 
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
    end

    def self.find(id, db)
       row =  db.execute("SELECT * FROM pokemon WHERE id = ?;", id)
       new_pokemon = Pokemon.new(id: row[0][0], name: row[0][1], type: row[0][2], db: db)
       new_pokemon
    end 
        


end

