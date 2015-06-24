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
  
  def test_index_page
    get '/'
    assert last_response.ok?
    assert_equal "Testing all the things!", last_response.body
  end
  
  def test_new_page
    get '/todos'
    assert last_response.ok?
    assert_equal "#{@todos}", last_response.body
  end
end