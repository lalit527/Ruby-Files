"""
Enumerable objects come with several tools for element-handling
"""
p [1,2,3,4].first
p (1..10).first
# p {1 => 2, "one" => "two"}.first


puts "======================================================="
puts "+++++++++++++++Yielding a non-terminating loop+++++++++++++="
puts "======================================================="
class Die
  include Enumerable
  def each
    loop do
      yield rand(6) + 1
    end
  end
end

puts "Welcome to 'You Win if You Roll a 6'!"
d = Die.new
d.each do |roll|
  puts "You rolled a #{roll}."
  if roll == 6
    puts "You win!"
    break
  end
end

"""
it would be meaningless to call last on your die object, because there’s no last roll of the die. Unlike taking the first element, 
taking the last element of an enumerable has no generalizable meaning.
"""

puts "======================================================="
puts "++++++++Take and Drop Methods+++++++++++++="
puts "======================================================="
states = %w{NJ NY CT MA VT FL}
p states.take(2)
p states.drop(2)

p states.take_while {|s| /N/.match(s) }

p states.drop_while {|s| /N/.match(s) } 

puts "======================================================="
puts "++++++++Min and Max Methods+++++++++++++="
puts "======================================================="
p [1,3,5,4,2].max
p %w{ Ruby C APL Perl Smalltalk }.min

p %w{ Ruby C APL Perl Smalltalk }.min_by {|lang| lang.size }

p %w{ Ruby C APL Perl Smalltalk }.minmax

p %w{ Ruby C APL Perl Smalltalk }.minmax_by {|lang| lang.size }

puts "======================================================="
puts "++++++++Relative of Each+++++++++++++="
puts "======================================================="
names = ["George Washington", "John Adams", "Thomas Jefferson", "James Madison"]
names.each_with_index do |pres, i|
  puts "#{i + 1}. #{pres}"
end
## In hases, below index will be 0 1 2
letters = {"a" => "ay", "b" => "bee", "c" => "see" }
letters.each_with_index {|(key,value),i| puts i }

puts "======================================================="
puts "++++++++Each Slice+++++++++++++="
puts "======================================================="
array = [1,2,3,4,5,6,7,8,9,10]
array.each_slice(3) {|slice| p slice }

puts "======================================================="
puts "++++++++Cycle Method+++++++++++++="
puts "======================================================="
class PlayingCard
  SUITS = %w{ clubs diamonds hearts spades } 
  RANKS = %w{ 2 3 4 5 6 7 8 9 10 J Q K A }
  class Deck 
    attr_reader :cards
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

p deck = PlayingCard::Deck.new(2)

puts "======================================================="
puts "++++++++Inject Method+++++++++++++="
puts "======================================================="
p [1,2,3,4].inject(0) {|acc,n| acc + n }

"""
The accumulator is initialized to 0, courtesy of the 0 argument to inject. The first time through the iteration—the code block—acc is 0, and n is set to 1 (the first item in the array). 
The result of the calculation inside the block is 0+1, or 1.
"""
[1,2,3,4].inject do |acc,n| 
  puts "adding #{acc} and #{n}...#{acc+n}" 
  acc + n 
end