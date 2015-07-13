require './test/test_helper'
require './config/environment'

class IndexPageTest < MiniTest::Test
  
  def setup
    @heading = "This is your todo app."
    @todos_index_url = "/todos#awesome"
    @name = "John"
  end
  
  def test_its_attributes
    assert_equal "This is your todo app.", @heading
    assert "/todos#awesome"
    assert_equal "John", @name
  end
  
  def test_returns_greeting
    assert_equal "Hello, #{@name}", IndexPage.greeting
  end
  
  

end
