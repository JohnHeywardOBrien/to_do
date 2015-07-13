# test.rb
require './test/test_helper'
require './config/environment'

class SinatraTest < MiniTest::Test

  include Rack::Test::Methods
  
  # the following are commented out as they are redundant and not really needed

  # def setup
  #   @todos = Todo.all
  # end
  
  # def test_it_gets_index
  #   get '/'
  #   # assert last_response.ok?
  #   assert_equal 200, last_response.status
  #   # assert true
  # end
  
  # # need to add gets 
  # def test_it_gets_new_page_returns_todos
  #   get '/todos'
  #   assert_equal 200, last_response.status
  # end
  

  

  
end