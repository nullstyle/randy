module Randy::Distributions
  class Uniform < Base
    
    def initialize(sample_space)
      case sample_space
      when Range ;
        @sample_space = sample_space
        @size = @sample_space.end - @sample_space.begin
        @next = lambda{ rand(@size) + @sample_space.begin }
      when Array ; 
        @sample_space = sample_space
        @size = sample_space.size
        @next = lambda{ @sample_space[rand(@size)] }
      else
        raise ArgumentError, "Invalid sample space: provide an Array or Range"
      end
    end
  
    def next
      @next.call
    end
  end
end