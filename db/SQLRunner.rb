require('pg')
require_relative('db.config')

class SQLRunner

	def self.run(sql, values = [])
		begin
			db = PG.connect($db_conn)
			db.prepare('query', sql)
			result = db.exec_prepared('query', values)
		ensure
			db.close
		end
		return result
	end

end