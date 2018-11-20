require "dm-core"
require "dm-migrations"
require "dm-timestamps"

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/appDB.db")

#DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/appDB.db")

class StudentsData
	include DataMapper::Resource 
	property :id, Serial 
	property :firstname, String
	property :lastname, String
	property :birth, Date
	property :address, Text
end


class Comment
	include DataMapper::Resource
	property :commentId, Serial
	property :created_at, DateTime
	property :name, String
	property :content, Text
end

DataMapper.finalize

