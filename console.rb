require('pry')
require_relative('./models/Album.model')
require_relative('./models/Artist.model')

artist_1 = Artist.new({'name' => 'Squeeze'})
album_1 = Album.new({
	'title' => 'Greatest Hits',
	'artist_id' => 1,
	'genre' => 'pop'
})

artist_1.save
album_1.save

binding.pry
nil