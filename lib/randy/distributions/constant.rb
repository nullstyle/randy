module Randy::Distributions
  class Constant < Base
    attr_reader :constant
  
    def initialize(constant)
      @constant = constant
    end
  
    def next
      @constant
    end
  end
end