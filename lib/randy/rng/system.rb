module Randy::Rng
  ##
  # Uses ruby's built in Random class to generate the numbers
  #
  class System < Base
    MAX_I = 2**31 - 1
    MIN_I = -(2**31)
    I_LIMIT = MIN_I..MAX_I

    MAX_L = 2**63 - 1
    MIN_L = -(2**63)
    L_LIMIT = MIN_L..MAX_L

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