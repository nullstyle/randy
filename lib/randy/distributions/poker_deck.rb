module Randy::Distributions
  class PokerDeck < Deck
    RANKS = %w( A 2 3 4 5 6 7 8 9 T J Q K )
    SUITS = %w( H C D S )
    CARDS = RANKS.flat_map do |r|
              SUITS.map{|s| r + s}
            end
            
    def initialize
      super CARDS.dup
    end
  end
end