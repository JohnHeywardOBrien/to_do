class IndexPage
    attr_reader :heading, :todos_index_url, :name
    
    def initialize(heading, todos_index_url, name)
      @heading         = heading
      @todos_index_url = todos_index_url
      @name            = name
    end
    
    def greeting
      "Hello, #{@name}"
    end
    
    def run
    end
    
end