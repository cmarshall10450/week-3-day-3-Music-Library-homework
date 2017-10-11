require_relative('../db/SQLRunner')
require_relative('./Album.model')

class Artist

	attr_accessor :name

	def initialize(options)
		@id = options['id'].to_i if options['id']
		@name = options['name']
	end

	def save
		sql = 'INSERT INTO artists (name) VALUES ($1) RETURNING id;'
		values = [@name]
		@id = SQLRunner.run(sql, values)[0]['id'].to_i
	end

	def update
		sql = 'UPDATE artists SET (name) = ($1) WHERE id = $2;'
		values = [@name, @id]
		SQLRunner.run(sql, values)
	end

	def delete
		sql = 'DELETE FROM artists WHERE id = $1'
		values = [@id]
		SQLRunner.run(sql, values)
	end

	def self.all
		sql = 'SELECT * FROM artists;'
		values = []
		artists = SQLRunner.run(sql, values).map { |artist|
			Artist.new(artist)
		}

		return artists
	end

	def albums
		sql = 'SELECT * FROM albums WHERE artist_id = $1;'
		values = [@id]

		albums = SQLRunner.run(sql, values).map { |album|
			Album.new(album)
		}

		return albums
	end
end