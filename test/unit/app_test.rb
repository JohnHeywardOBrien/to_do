# test.rb
require './test/test_helper'
require './config/environment'


class TodoTest < MiniTest::Test

  include Rack::Test::Methods

  def app
    TodoApp
  end
  
  def test_exists
    assert_equal 0, Todo.count # guard clause to make sure we're using clean db
    Todo.transaction do
      Todo.create(:todo_description => 'ugh ugh ugh')
      assert_equal 1, Todo.count
      raise ActiveRecord::Rollback
    end
    assert_equal 0, Todo.count
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