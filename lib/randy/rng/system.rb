module Randy::Rng
  ##
  # Uses ruby's built in Random class to generate the numbers
  #
  class System < Base
    I_LIMIT = (2**32 - 1)
    L_LIMIT = (2**64 - 1)

    def initialize(*args)
      super *args
      @rand = Random.new(self.seed)
    end

    def next_i
      @rand.rand(I_LIMIT)
    end
    
    def next_l
      @rand.rand(L_LIMIT)
    end

    def next_f
      @rand.rand
    end
  end
end