require_relative("./SQL_Runner")

class Movie

attr_reader :id
attr_accessor :title, :genre, :rating

def initialize ( options )
  @id = options['id'].to_i
  @title = options ['title']
  @genre = options ['genre']
  @rating = options ['rating']
end

def save()
    sql = "INSERT INTO movies
    (title, genre, rating)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@title, @genre, @rating]
    movies = SqlRunner.run( sql, values ).first
    @id = movies['id'].to_i
end

def update()
  sql = "UPDATE movies SET (title, genre, rating) = ($1, $2, $3) WHERE id = $4 "
  values = [@title, @genre, @rating, @id]
  SqlRunner.run(sql, values)
end

def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

def stars()
    sql = "SELECT star
    .* FROM stars
    INNER JOIN visits ON users.id = visits.user_id WHERE location_id = $1"
    values = [@id]
    users = SqlRunner.run(sql, values)
    return stars.map { |stars| Star.new(stars) }
end

end
