module Randy::Distributions
  class Uniform < Base
  
    def initialize(bounds)
      @bounds = bounds
      @range = @bounds.end - @bounds.begin
    end
  
    def next
      rand(@range) + @bounds.begin
    end
  end
end