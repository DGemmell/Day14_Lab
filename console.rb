require_relative( './movie')
require_relative( './star')
require_relative( './casting')

require( 'pry-byebug' )

Movie.delete_all()
Star.delete_all()
Casting.delete_all()

movie1 = Movie.new ({ 'title' => 'Indiana Jones and the Temple of Doom' })
movie1.save()

star1 = Star.new ({'first_name' => 'Harrison', 'last_name' => 'Ford'})
star1.save()
star2 = Star.new ({'first_name' => 'Dan', 'last_name' => 'Aykroyd'})
star2.save()
star3 = Star.new ({'first_name' => 'Denholm', 'last_name' => 'Elliot'})
star3.save()

casting1 = Casting.new ({'movieid' => movie1.id, 'moviestarid' => star1.id, 'fee' => 100000000})
casting1.save()
casting2 = Casting.new ({'movieid' => movie1.id, 'moviestarid' => star2.id, 'fee' => 5000000})
casting2.save()
casting3 = Casting.new ({'movieid' => movie1.id, 'moviestarid' => star3.id, 'fee' => 3000000})
casting3.save()

binding.pry
nil
