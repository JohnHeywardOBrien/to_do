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
    assert last_response.ok?
    assert_equal "Testing all the things!", last_response.body
    assert true
  end
  
  def test_it_gets_new_page_returns_todos
    get '/todos'
    assert last_response.ok?
    assert last_response.body.include?(@todos.to_s)
    assert_empty []
    assert true 
  end
end