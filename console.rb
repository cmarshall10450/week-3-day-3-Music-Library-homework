require('pry')
require_relative('./models/Album.model')
require_relative('./models/Artist.model')

artist_1 = Artist.new({'name' => 'Squeeze'})
album_1 = Album.new({
	'title' => 'Greatest Hits',
	'artist_id' => 1,
	'genre' => 'pop'
})

binding.pry
nil