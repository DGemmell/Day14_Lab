require_relative("./SQL_Runner")

class Star

attr_reader :id
attr_accessor :first_name, :last_name

def initialize ( options )
  @id = options['id'].to_i
  @first_name = options ['first_name']
  @last_name = options ['last_name']
end

def save()
    sql = "INSERT INTO stars
    (first_name, last_name)
    VALUES ($1, $2)
    RETURNING id"
    values = [@first_name, @last_name]
    stars = SqlRunner.run( sql, values ).first
    @id = stars['id'].to_i
end

def update()
  sql = "UPDATE stars SET (first_name, last_name) = ($1, $2) WHERE id = $3 "
  values = [@first_name, @last_name, @id]
  SqlRunner.run(sql, values)
end

def self.delete_all()
    sql = "DELETE FROM stars"
    SqlRunner.run(sql)
  end

def movies()
  sql = " SELECT * FROM movies INNER JOIN castings ON movies.id = castings.movieid WHERE moviestarid = $1"
  values = [@id]
  movies = SqlRunner.run(sql, values)
  return movies.map { |movie| Movie.new(movie) }
end

def movies()
    sql = "SELECT movies
    .* FROM movies
    INNER JOIN visits ON users.id = visits.user_id WHERE location_id = $1"
    values = [@id]
    users = SqlRunner.run(sql, values)
    return movies.map { |movies| Movie.new(movies) }
end

end
