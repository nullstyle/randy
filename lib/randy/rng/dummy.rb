module Randy::Rng
  ##
  # A dummy random number generator that is used in tests only
  # 
  class Dummy < Base
    BITMASK_32 = (1 << 32) - 1 # used for generating floats

    def initialize(seed, results)
      super seed
      @results = results
    end

    def next_i
      @results.shift
    end
    
    def next_l
      @results.shift
    end

    def next_f
      next_value = @results.shift
      next_value.is_a?(Float) ? next_value : (next_value.to_i / BITMASK_32.to_f)
    end
  end
end