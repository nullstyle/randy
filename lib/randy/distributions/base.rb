module Randy::Distributions
  class Base
    def next
      raise "implement in subclass"
    end
  end
end