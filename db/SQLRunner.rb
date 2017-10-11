require('pg')
require_relative('db.config')

class SQLRunner

	def self.run(sql, values = [])
		begin
			# To make the connection work I need to pass in a username
			# and password. I have therefore extracted the connection
			# details to a separate file as to not expose my password on
			# GitHub.
			db = PG.connect($db_conn)
			db.prepare('query', sql)
			result = db.exec_prepared('query', values)
		ensure
			db.close
		end
		return result
	end

end