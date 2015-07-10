# test.rb
require './test/test_helper'
require './config/environment'


class DatabaseTest < MiniTest::Test

  # def app
  #   TodoApp
  # end
  
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