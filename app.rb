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

class ToDo < Sinatra::Base
    
  configure do
      register Sinatra::Flash
      set :method_over, true
      enable :sessions
  end
  
  # index
  get '/' do 

    erb :index
  end

  get '/new' do
    
    erb :new
  end
end
 