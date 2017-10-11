require_relative('../db/SQLRunner')

class Artist

	attr_accessor :name

	def initialize(options)
		@id = options['id'].to_i if options['id']
		@name = options['name']
	end

end