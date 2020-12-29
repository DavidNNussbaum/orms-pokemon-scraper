class Pokemon
    attr_accessor :id, :name, :type, :db
    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        # if self.id
        #     self.update
        # else
        sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        SQL
         db.execute(sql, name, type)
         
    end
    def self.find(num, db)
        # sql = <<-SQL
        # SELECT * FROM pokemon 
        # WHERE @id = ?
        # SQL
    new_ob = db.execute("SELECT * FROM pokemon WHERE id = ?", num).flatten
    Pokemon.new(id: new_ob[0], name: new_ob[1], type: new_ob[2], db: db)
    end

end
 

