"""
Symbols are immutable
"""
puts "abc".object_id
puts "abc".object_id
puts :abc.object_id # symbol are always unique
puts :abc.object_id # symbol are always unique(same memory address)

puts "======================================================="
puts "++++++++All Symbol in Ruby++++++++++="
puts "======================================================="
puts Symbol.all_symbols.size
"""
When you assign a value to a variable or constant, or create a class or write a method, 
the identifier you choose goes into Ruby’s internal symbol table
"""
xyzs = 1 # it creates new symbol while parsing the file
puts Symbol.all_symbols.size

puts "======================================================="
puts "+++++++++++++++Symbol as Method arguments+++++++++++++="
puts "======================================================="
"""
You don’t normally need send if you know the whole method name in advance. But the lesson here is that send can take a symbol, 
which remains true even if the symbol is stored in a variable,
"""
def dummy
  attr_accessor :name 
  attr_reader :age
end
puts "abc".send(:upcase)
# puts "abc".send(:upcase2)
puts "======================================================="
puts "+++++++++++++++Symbol as Hash Keys+++++++++++++="
puts "======================================================="
d_hash = { :name => "David", :age => 49 }
puts d_hash
d_hash = { "name" => "David", "age" => 49 }
puts d_hash
"""
First, Ruby can process symbols faster, so if you’re doing a lot of hash lookups, 
you’ll save a little time.
"""