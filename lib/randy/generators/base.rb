module Randy::Generators
  class Base
    
    def initialize(rng)
      @rng = rng
    end

    def get
      raise "implement in subclass"
    end
  end
end