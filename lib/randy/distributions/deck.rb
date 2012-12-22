module Randy::Distributions
  ##
  # Provided a uniform distribution that ensures uniqueness of picks.  Acts
  # like a deck of cards
  # 
  class Deck < Base
    
    def initialize(cards)    
      @cards = cards
      
      @next = lambda do |rng| 
        index = rng.next_i % @size
        @sample_space[index]
      end
    end
    
    def remove(to_remove)
      @cards -= to_remove
    end
  
    def next(rng)
      return nil if @cards.empty?
      index = rng.next_i % @cards.length
      @cards.delete_at(index)
    end
  end
end