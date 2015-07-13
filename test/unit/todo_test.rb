# test.rb
require './test/test_helper'
require './config/environment'


class NewTodoTest < MiniTest::Test

  include Rack::Test::Methods
  
  def app
    TodoApp
  end
  
  def setup
    @todo = Todo.new
    @todo.title = 'some title'
    @todo.body  = 'some body'

    @todo_all = Todo.all
    # @all_todos = Todo.all
     
    @header_message = "Here are your todos:"
  end
 
  def teardown
    @todo.destroy!
  end
  
  # this be the real tests, dawg
  def test_know_its_attributes
    assert_respond_to @todo, :title
    assert_respond_to @todo, :body
    assert_respond_to @todo, :completed
    assert_respond_to @todo, :created
  end
  
  def test_its_attributes
    assert_equal "some title", @todo.title
    assert_equal "some body",  @todo.body
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
  
  def test_it_saves_correctly
    assert @todo.save
  end
  
  def test_it_destroys_correctly
    @todo.save!
    count_before_destroy = Todo.count
    Todo.last.destroy!
    count_after_destroy = Todo.count
    refute_equal count_before_destroy, count_after_destroy
  end
  

end
