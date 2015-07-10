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

# GET /todos            Retrieves a list of all todo items in the database
# GET /todos/index      Retrieves a single todo item from the database
# POST /todos           Inserts a todo item in the database
# PUT /todos            Updates a todo item in the database
# DELETE /todos         Deletes a todo item from the database

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
    @view = IndexPage.new('Hi There John!', '/todos#awesome')
    erb :index
  end

  # view model - put all business logic in these
  class IndexPage
    attr_reader :heading, :todos_index_url
    
    def initialize(heading, todos_index_url)
      @heading         = heading
      @todos_index_url = todos_index_url
    end
    
    def run
    end
    
  end  



  
  # new todo page
  get '/todos' do
    @todos = Todo.order("created_at DESC") 
    @header_message = @todos.length == 0 ? "You don't have todos!" : "Here are your todos:"
    
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
