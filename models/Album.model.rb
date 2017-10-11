require_relative('../db/SQLRunner')

class Album

	attr_accessor :title, :genre

	def initialize(options)
		@id = options['id'].to_i if options['id']
		@artist_id = options['artist_id'].to_i
		@title = options['title']
		@genre = options['genre']
	end

	def save
		sql = 'INSERT INTO albums (
						artist_id,
						title,
						genre
					)
					VALUES (
						$1, $2, $3
					)
					RETURNING id;'

		values = [@artist_id, @title, @genre]
		@id = SQLRunner.run(sql, values)[0]['id'].to_i
	end

	def update
		sql = 'UPDATE albums
					SET (
						artist_id,
						title,
						genre
					) =
					(
						$1, $2, $3
					)
					WHERE id = $4;'

		values = [@artist_id, @title, @genre, @id]

		SQLRunner.run(sql, values)
	end

end