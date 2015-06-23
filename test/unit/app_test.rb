# test.rb
require './test/test_helper'
require './config/environment'

# need to further break up these tests
# ugh




class DatabaseTest < MiniTest::Test

  include Rack::Test::Methods

  def app
    TodoApp
  end
  
  # learning about testing writes to a database
  def test_database_trans
    assert_equal 0, Todo.count # guard clause to make sure we're using clean db
    Todo.transaction do
      Todo.create(:body => 'ugh ugh ugh')
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
  
  def setup
    @todo = TodoApp.new
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
    @todo = Todo.new
    @todo.title = "New todo"
    @todo.body = "about todo"
    # @todo.completed = 
  end
  
  def test_description
    assert_equal "This is a test", @todo.description
  end
  
  def test_its_attributes
    assert_equal "New todo", @todo.title
    assert_equal "about todo", @todo.body
  end

end
