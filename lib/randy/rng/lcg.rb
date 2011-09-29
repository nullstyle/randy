module Randy::Rng
  ##
  # A implementation of Java's System.Random LCG
  class Lcg < Base
    include Randy::Util::FixedWidthIntegers
        
    SEED_XOR   = 0x5DEECE66D
    ADDEND     = 0xB
    BITMASK_48 = (1 << 48) - 1

    def initialize(*args)
      super *args
      @state = (self.seed ^ SEED_XOR) & BITMASK_48
      @bitmasks ||= {}
    end

    def next_i
      next_bits(32).to_i
      
    end
    
    def next_l
      result = SFWI.new(next_bits(32).to_i, 64) << 32
      result += next_bits(32).to_i
      result.to_i
    end

    def next_f
      result = SFWI.new(next_bits(26).to_i, 64) << 27
      result += next_bits(27).to_i
      result.to_i / bitmask(53).to_f
    end


    private
    def next_bits(bits)
      @state = (@state * SEED_XOR + ADDEND) & BITMASK_48;
      raw = (@state >> (48 - bits)) & bitmask(bits)
      SFWI.new(raw, bits)
    end

    def bitmask(bits)
      @bitmasks[bits] || (1 << bits) - 1
    end
  end
end