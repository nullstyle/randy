module Randy::Rng
  class Base
    attr_reader :seed

    def initialize(seed=nil)
      @seed = seed || (Time.now.to_f * 1000).to_i
    end

    ##
    # Returns the next 32-bit signed integer from this rng
    # 
    # @return [Integer] the result
    def next_i
      raise "implement in subclass"
    end

    ##
    # Returns the next 64-bit signed integer from this rng
    # 
    # @return [Integer] the result
    def next_l
      raise "implement in subclass"
    end

    ##
    # Returns the next double precision floating number from this rng
    # 
    # @return [Float] the result
    def next_f
      raise "implement in subclass"
    end
  end
end