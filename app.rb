require 'bundler'
Bundler.require

require 'sqlite3'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'active_record'
require 'rake'
require 'time'
require 'date'
require 'json'
require 'chronic'
require 'assert'
require 'tilt/erb'

require './lib/models/todo'
require './lib/view_models/index/index_page'
require './lib/models/time'

class TodoApp < Sinatra::Base
    
  configure do
      register Sinatra::Flash
      set :method_over, true
      enable :sessions
  end
  
  # index page
  get '/' do 
    # this is a route handler block - no business in here b/c it is
    # really hard to unit test
    # instead create view models, put all business logic in that
    # then unit test the view models
    @view = IndexPage.new('This is your todo app.', '/todos#awesome', 'John')
    erb :index
  end

  # view model - put all business logic in these
  # see /lib/view_models/... for actualy location of files
   



  
  # new todo page
  get '/todos' do
    @todos = Todo.order("created_at DESC") 
    
    erb :todos
  end
 
  # adds todo to database 
  post '/todos' do
    
  end
  
  # updates a todo in the database 
  puts '/todos' do
  
  end
  
  not_found do
		status 404
		erb :not_found
	end
end
