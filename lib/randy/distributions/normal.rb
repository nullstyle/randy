module Randy::Distributions
  ##
  # This distribution uses the Box Muller transformation to get random numbers 
  # in a gaussian distribution.  Note, this transform produces two numbers per
  # round, so we keep the 2nd value saved and return it on the second call
  # to next.  The Box Muller transform produces number with a mean of 0 and
  # standard deviation of 1.
  # 
  # See http://en.wikipedia.org/wiki/Box%E2%80%93Muller_transform
  # 
  class Normal < Base
    PI2 = Math::PI * 2

    def initialize(mean, stdev)
      @mean = mean
      @stdev = stdev

      raise ArgumentError, "stdev cannot be < 0" if stdev < 0.0

      @saved_results = []
    end
  
    def next(rng)
      generate_results(rng) if @saved_results.empty?

      @mean + @saved_results.shift * @stdev
    end

    private
    # Returns the next two guassian number to come out of this distribution
    def generate_results(rng)
      u1 = rng.next_f
      u2 = rng.next_f

      @saved_results << Math.sqrt(-2 * Math.log(u1)) *  Math.cos(PI2 * u2)
      @saved_results << Math.sqrt(-2 * Math.log(u1)) *  Math.sin(PI2 * u2)
    end
  end
end