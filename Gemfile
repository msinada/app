# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"
#

source :rubygems 
gem "sinatra" 
gem "dm-core" 
gem "dm-migrations" 
gem "thin"
group :development, :test do
	gem 'sqlite3'
end
#group :production do
	gem "pg"
#end
gem "dm-postgres-adapter", :group => :production
gem "dm-sqlite-adapter", :group => :developmentRuby
