require 'bundler'
require 'bundler/setup'
Bundler.require

db_options = YAML.load(File.read('./config/database.yml'))
ActiveRecord::Base.establish_connection(db_options)

require File.expand_path '../../app.rb', __FILE__