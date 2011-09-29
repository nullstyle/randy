module Randy::Distributions
  class Uniform < Base
    
    def initialize(sample_space)
      case sample_space
      when Range ;
        @sample_space = sample_space
        @size = @sample_space.end - @sample_space.begin
        @next = lambda do |rng| 
          extent = rng.next_i % @size
          @sample_space.begin + extent
        end
      when Array ; 
        @sample_space = sample_space
        @size = sample_space.size
        @next = lambda do |rng| 
          index = rng.next_i % @size
          @sample_space[index]
        end
      else
        raise ArgumentError, "Invalid sample space: provide an Array or Range"
      end
    end
  
    def next(rng)
      @next.call rng
    end
  end
end