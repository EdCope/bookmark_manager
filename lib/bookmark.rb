require 'pg'

class Bookmark 
    
  def self.all
		
		connection_to_database

    rs = @conn.exec "SELECT * FROM bookmarks"
    rs.map { |bookmark| bookmark['url'] }

  end

	def self.add(url)
		connection_to_database

		@conn.exec "INSERT INTO bookmarks(url) VALUES('#{url}');"

	end	

	private 

	def self.connection_to_database
		if ENV['RACK_ENV'] == 'test'
			@conn = PG.connect( dbname: 'bookmark_manager_test' )
		else
			@conn = PG.connect( dbname: 'bookmark_manager' )
		end
	end

end
