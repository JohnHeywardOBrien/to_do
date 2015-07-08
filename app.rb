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

# steven is a butt

class Todo 
  def description
    "This is a test"
  end

end




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
    
    erb :index
  end
  
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
  
  # deletes todo from database
  # destroy 
end
