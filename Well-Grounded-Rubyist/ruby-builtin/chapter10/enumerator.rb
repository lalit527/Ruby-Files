puts "======================================================="
puts "+++++++++++++++Enumerator's each+++++++++++++="
puts "======================================================="

array = %w{cat dog rabbit}
p array
e = array.map
p e
p e.each {|animal| animal.capitalize}

h = { "cat" => "feline", "dog" => "canine", "cow" => "bovine" }
h.select {|key,value| key =~ /c/ }
e = h.enum_for(:select)
p e

puts "======================================================="
puts "+++++++++++++++Protecting object with enumerators+++++="
puts "======================================================="
class PlayingCard
  SUITS = %w{ clubs diamonds hearts spades}
  RANKS = %w{2 3 4 5 6 7 8 9 10 J Q K A}

  class Deck
    def cards
      @cards.to_enum
    end

    def initialize(n=1)
      @cards = []
      SUITS.cycle(n) do |s|
        RANKS.cycle(1) do |r|
          @cards << "#{r} of #{s}"
        end
      end
    end
  end
end

deck = PlayingCard::Deck.new
# deck.cards << "Joker!!" # undefined method `<<' for #<Enumerator:0x007fb797856b40>


puts "======================================================="
puts "++++++Fine grained iterations with enumerators++++++++="
puts "======================================================="
module Music
  class Scale
    NOTES = %w{ c c@ d d@ e f f@ g a a@ b }

    def play
      NOTES.each {|note| yield note}
    end
  end
end

scale = Music::Scale.new
scale.play {|note| note.upcase }
# scale.map {|note| note.upcase} thorws error
enum = scale.enum_for(:play)
p enum.map {|note| note.upcase}
p enum.select{|note| note.include?('f')}

puts "======================================================="
puts "++++++Fine grained iterations with enumerators++++++++="
puts "======================================================="
names = %w{David Yukihiro}
e = names.to_enum
puts e.next
puts e.next
e.rewind
puts e.next


puts "======================================================="
puts "++++++Enumerator method chaining++++++++="
puts "======================================================="
