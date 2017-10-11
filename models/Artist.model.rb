require_relative('../db/SQLRunner')

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
end