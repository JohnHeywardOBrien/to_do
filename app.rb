require 'bundler'
Bundler.require

require 'sqlite3'
require 'sinatra/base'
require 'sqlite3'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'active_record'
require 'rake'
require 'time'
require 'date'
require 'sinatra/flash'
require 'json'
require 'chronic'
require 'mail'
require 'assert'

#ugh ugh

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
 