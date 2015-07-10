# test.rb
require './test/test_helper'
require './config/environment'

class SinatraTest < MiniTest::Test

  include Rack::Test::Methods

  def app
    TodoApp
  end
  
  def setup
    @todos = Todo.all
  end
  
  def test_it_gets_index
    get '/'
    # assert last_response.ok?
    assert_equal 200, last_response.status
    # assert true
  end
  
  # need to add gets 
  def test_it_gets_new_page_returns_todos
    get '/todos'
    # assert last_response.ok?
    assert_equal 200, last_response.status
    # assert true 
  end
  
  def test_displays_not_found
    get '/not_founds'
  end
  

  
end