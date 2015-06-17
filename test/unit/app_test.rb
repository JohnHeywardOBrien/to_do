# test.rb
require File.dirname(__FILE__) + '/../test_helper'

class MyTest < MiniTest::Test

  include Rack::Test::Methods

  def app
    ToDo
  end

  def test_hello_world
    get '/'
    assert last_response.ok?
    assert_equal "Testing all the things!", last_response.body
  end
  
  def test_new_todo
      get '/new'
      assert last_response.ok?
      assert_equal "New todo here", last_response.body
  end

end