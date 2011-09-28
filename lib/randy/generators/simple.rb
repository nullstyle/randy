module Randy::Generators
  class Simple < Base
    def initialize(rng, distribution)
      super rng
      @distribution = distribution
    end

    def get
      @distribution.next
    end
  end
end