# test.rb
require './test/test_helper'
require './config/environment'


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
