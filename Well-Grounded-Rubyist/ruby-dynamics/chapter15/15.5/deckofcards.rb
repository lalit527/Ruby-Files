module PlayingCards
  RANKS = %w{ 2 3 4 5 6 7 8 9 10 J Q K A }
  SUITS = %w{ clubs diamonds hearts spades }
  class Deck
    def initialize
      @cards = []
      RANKS.each do |r|
        SUITS.each do |s|
          @cards << "#{r} of #{s}"
        end
      end

      @cards.shuffle!
      
      def deal(n=1)
        n.times.map { @cards.pop }
      end

      def size
        @cards.size
      end
    end
  end
end