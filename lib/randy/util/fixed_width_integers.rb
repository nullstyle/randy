module Randy::Util
  module FixedWidthIntegers
    ##
    # Taken from here: http://rubyquiz.com/quiz85.html
    # Originally by Boris Prinz
    class UFWI
      def initialize(value, bits)
        raise ArgumentError.new('number of bits must be > 0') if bits <= 0
        @bits  = bits
        @value = value % 2**@bits
      end

      # operators returning a new FixedWidthInt
      %w{& ^ | << >> + - * / +@ -@ ~@}.each do |operator|
        define_method operator do |*other|
          self.class.new(@value.send(operator, *other), @bits)
        end
      end

      # methods forwarded to @value
      %w{== < > <=> inspect to_s to_i to_int}.each do |meth|
        define_method meth do |*other|
          @value.send(meth, *other)
        end
      end

      def coerce(other)
        Integer == other ? [other, @value] : [Float(other), Float(@value)]
      end
    end

    class SFWI < UFWI
      def initialize(value, bits)
        super(value, bits)
        # value is negative if MSB is set:
        @value -= 2**@bits if @value[@bits - 1] == 1
      end
    end
  end
end