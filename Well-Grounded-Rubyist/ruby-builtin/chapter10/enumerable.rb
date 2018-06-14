failure = lambda { 11 }
over_ten = [1, 2, 3, 4, 5, 6].find(failure) { |n| n > 10 }
p over_ten

puts "======================================================="
puts "+++++++++++++++Enumerable return array+++++++++++++="
puts "======================================================="
# r = Rainbow.new
# p r.select {|color| color.size == 6}
# ["orange", "yellow", "indigo", "violet"]
# r.map {|color| color[0, 3]}
# p r.drop_while {|color| color.size < 5}

puts "======================================================="
puts "+++++++++++++++Enumerable return array+++++++++++++="
puts "======================================================="

a = [1,2,3,4,5,6,7,8,9,10]
p a.find_all {|item| item > 5 }

p a.select {|item| item > 100 }

p a.reject {|item| item < 5 }

"""
The bang version of reject (reject!) makes the item removal permanent in the original object.
"""

puts "======================================================="
puts "+++++++++++++++Three Equal Matches+++++++++++++="
puts "======================================================="
colors = %w{ red orange yellow blue indigo violet }
p colors.grep(/o/)

miscellany = [75, "hello", 10...20, "goodbye"]
p miscellany.grep(String)
p miscellany.grep(50..100)

"""
the statement enumerable.grep(expression) is functionally equivalent to this:
enumerable.select {|element| expression === element }
"""

puts "======================================================="
puts "++++++++++++Group By and Partition+++++++++++++="
puts "======================================================="
colors = %w{ red orange yellow blue indigo violet }
p colors.group_by { |color| color.size }

class Person
  attr_accessor :age
  def initialize(options)
    self.age = options[:age]
  end
end