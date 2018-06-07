puts "======================================================="
puts "+++++++++++++++Creating a Range+++++++++++++="
puts "======================================================="

r = Range.new(1, 100)
puts r ## print 1..100

r = 1..100
puts r ## print 1..100

"""
Range with 2 dots are inclusive range
Range with 3 dots are exclusive range
"""
puts "======================================================="
puts "+++++++++++++++Creating a incl and excl Range+++++++++++++="
puts "======================================================="
puts Range.new(1, 100)
puts Range.new(1, 100, true)

puts "======================================================="
puts "+++++++++++++++Range Inclusion logic+++++++++++++="
puts "======================================================="
r = 1..10
puts r
puts r.begin
puts r.end
puts r.exclude_end? 

puts "======================================================="
puts "+++++++++++++++Testing range inclusion+++++++++++++="
puts "======================================================="
r = "a".."z"
puts r
puts r.cover?("abc")
puts r.cover?("A")

puts "======================================================="
puts "+++++++++++++++Backward Range+++++++++++++="
puts "======================================================="
r = 100..1
"""
The range happily performs its usual inclusion test for you. The test calculates whether the candidate for inclusion is greater than the start point of the range and less than the end point. 
Because 50 is neither greater than 100 nor less than 1, the test fails. A
"""

puts "======================================================="
puts "+++++++++++++++Backward Range+++++++++++++="
puts "======================================================="
puts "This is a sample string"[10..-5]
p ['a', 'b', 'c', 'd'][0..-2]
p ['a', 'b', 'c', 'd'][0...-2]
