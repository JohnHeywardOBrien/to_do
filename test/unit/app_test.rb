# test.rb
require './test/test_helper'

db_options = {adapter: 'sqlite3', database: 'todo_test'}
ActiveRecord::Base.establish_connection(db_options)


class CreateToDo < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :todo_description
    end
  end
end

begin
  CreateToDo.new.change
rescue ActiveRecord::StatementInvalid
  # might work
end


class Todo < ActiveRecord::Base
end


class TodoTest < MiniTest::Test

  include Rack::Test::Methods

  def app
    ToDo
  end
  
  def test_exists
    todo = Todo.new(:todo_description => 'a new todo')
    assert_equal 'a new todo', todo.todo_description
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