source 'https://rubygems.org'
ruby "2.2.1"

gem 'rake'
gem 'sinatra', require: 'sinatra/base'
gem 'shotgun'
gem 'puma'
gem 'dotenv'
gem 'mail'
gem 'assert'
gem 'assert-rack-test'
gem 'minitest-reporters'
gem 'activerecord'
gem 'minitest-untz'
gem 'sinatra-activerecord'
gem 'sinatra-flash'
gem 'humanize_boolean'
gem 'chronic' 
gem 'rack-test'

group :test do
  gem 'rack-test', require: false
end

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'sqlite3'
  # gem 'pg'
  # gem "activerecord-postgresql-adapter"
end
