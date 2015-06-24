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
    @new_todo = "new todo"
    @todo_title = "about todo"

  
    @todo = Todo.new
    @todo.title = @new_todo
    @todo.body = @todo_title
  end
  
  def test_description
    assert_equal "This is a test", @todo.description
  end
  
  def test_its_attributes
    assert_equal "new todo", @todo.title
    assert_equal "about todo", @todo.body
  end
 
  # need to work on figuring out how to test Date... :/
  # def test_date
    # date = Date.new(1912, 6, 23)
    # assert_equal "1912-06-23", date.sys_strftime
  # end
  
  # i guess this could be considered a duplicate of the above?
  def test_its_data
    data = {:title => 'George',
            :body => 'Washington',
            :completed => '2015-04-07',
            :created => '2015-03-01'
    }
    
    todo = Todo.new(data)
    assert_equal data[:title], todo.title
    assert_equal data[:body], todo.body
    assert_equal data[:completed], todo.completed.to_s
    assert_equal data[:created], todo.created.to_s
  end
end
