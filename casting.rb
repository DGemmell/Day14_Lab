require_relative("./SQL_Runner")

class Casting

attr_reader :id
attr_accessor :movieid, :moviestarid, :fee

def initialize ( options )
  @id = options['id'].to_i
  @movieid = options ['movieid']
  @moviestarid = options ['moviestarid']
  @fee = options ['fee']
end

def save()
    sql = "INSERT INTO castings
    (movieid, moviestarid, fee)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@movieid, @moviestarid, @fee]
    casting = SqlRunner.run( sql, values ).first
    @id = casting['id'].to_i
end

def update()
  sql = "UPDATE castings SET (movieid, moviestarid, fee) = ($1, $2, $3) WHERE id = $4 "
  values = [@movieid, @moviestarid, @fee, @id]
  SqlRunner.run(sql, values)
end

def self.delete_all()
    sql = "DELETE FROM castings"
    SqlRunner.run(sql)
  end

# def stars()
#   sql = "SELECT stars
#   .* FROM casting
#   INNER JOIN visits ON users.id = visits._id WHERE location_id = $1"
#   values = [@id]
#   users = SqlRunner.run(sql, values)
#   return users.map { |user| User.new(user) }

end
