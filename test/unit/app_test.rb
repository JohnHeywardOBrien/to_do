# test.rb
require './test/test_helper'
require './config/environment'

# need to further break up these tests

class DatabaseTest < MiniTest::Test

  include Rack::Test::Methods

  def app
    TodoApp
  end
  
  # learning about testing writes to a database
  def test_database_trans
    assert_equal 0, Todo.count # guard clause to make sure we're using clean db
    Todo.transaction do
      Todo.create(:todo_description => 'ugh ugh ugh')
      assert_equal 1, Todo.count
      raise ActiveRecord::Rollback
    end
    assert_equal 0, Todo.count
  end
  


end

class SinatraTest < MiniTest::Test

  include Rack::Test::Methods

  def app
    TodoApp
  end
  
  def test_index_page
    get '/'
    assert last_response.ok?
    assert_equal "Testing all the things!", last_response.body
  end
  
  def test_new_page
    get '/new'
    assert last_response.ok?
    assert_equal "New todo here", last_response.body
  end
  
  
end

class NewTodoTest < MiniTest::Test

  include Rack::Test::Methods

  def app
    TodoApp
  end
  
  def setup
    @new_todo = Todo.new
    @new_todo = "This is a string"
  end
   
  def test_new_todo
    assert_equal @new_todo, "This is a string"
  end
  
end
