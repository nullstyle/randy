module Randy::Distributions
  class Base
    def next(rng)
      raise "implement in subclass"
    end
  end
end