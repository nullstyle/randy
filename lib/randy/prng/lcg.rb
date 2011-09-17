module Randy::Prng
  ##
  # A implementation of Java's System.Random LCG
  class Lcg
    include Randy::Util::FixedWidthIntegers
    
    attr_accessor :seed
    
    SEED_XOR = 0x5DEECE66D
    BITMASK_48 = (1 << 48) - 1
    BITMASK_32 = (1 << 32) - 1

    def initialize(seed=nil)
      seed ||= (Time.now.to_f * 1000).to_i
      self.seed = seed 
    end

    def seed=(val)
      @seed = (val ^ SEED_XOR) & BITMASK_48
    end

    def next(max=nil)
      @seed = (@seed * SEED_XOR + 0xB) & BITMASK_48;
      raw = (@seed >> 16) & BITMASK_32
      result = SFWI.new(raw, 32).to_i
      
      max ? result % max : result
    end
  end
end