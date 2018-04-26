class TestLogger < Logger
    def initialize
      @strio = StringIO.new
      super(@strio)
    end
  
    def messages
      @strio.string
    end
  end