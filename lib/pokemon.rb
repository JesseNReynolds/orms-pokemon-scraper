class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL 
        INSERT INTO pokemon(name, type)
        VALUES (?, ?)
        SQL
        
        db.execute(sql, name, type)
    end

    def self.find(id_num, db)
        f = (db.execute("SELECT * FROM pokemon WHERE id = ?", id_num)[0])

        Pokemon.new(id: f[0], name: f[1], type: f[2], db: db)
    end



end
