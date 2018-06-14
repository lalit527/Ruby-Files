puts "======================================================="
puts "++++++++++++Map Method+++++++++++++="
puts "======================================================="
names = %w{ David Yukihiro Chad Amy }
p names.map {|name| name.upcase }
p names.map(&:upcase)

puts "======================================================="
puts "++++++++++++Map Return Value+++++++++++++="
puts "======================================================="
"""
The return value of map, and the usefulness of that return value, is what distinguishes map from each.
"""
result = names.each {|name| name.upcase }
puts result

result = names.map {|name| name.upcase }
puts result

puts "======================================================="
puts "++++++++++++Inplace Mapping+++++++++++++="
puts "======================================================="
names.map!(&:upcase)
puts names

puts "======================================================="
puts "++++++++++++String as quasi enumerables+++++++++++++="
puts "======================================================="
str = "abcde"
str.each_byte { |b| p b }
str.each_char {|c| p c}

str = "This string\nhas three\nlines" 
str.each_line {|l| puts "Next line: #{l}" }

str = "David!Alan!Black" 
$/ = "!" # Now, Ruby’s concept of a "line" will be based on the ! character:
str.each_line {|l| puts "Next line: #{l}" }

puts "======================================================="
puts "++++++++++++Sorting enumerables+++++++++++++="
puts "======================================================="
def <=>(other_painting)
  self.price <=> other_painting.price
end

# supply a block

# year_sort = [pa1, pa2, pa3].sort do |a, b|
#   a.year <=> b.year
# end

p ["2",1,5,"3",4,"6"].sort {|a,b| a.to_i <=> b.to_i }

p ["2",1,5,"3",4,"6"].sort_by {|a| a.to_i }

p ["2",1,5,"3",4,"6"].sort_by(&:to_i)

puts "======================================================="
puts "++++++++++++Enumerator+++++++++++++="
puts "======================================================="
e = Enumerator.new do |y|
  y << 1
  y << 2
  y << 3
end

# y is a yielder, an instance of Enumerator::Yielder,
p e.to_a

p e.map {|x| x * 10}

p e.select {|x| x > 1}

p e.take(2)