def my_loop1
  while true
    yield
  end
end

def my_loop2
  yield while true
end

## my_loop2 { puts "My loop!" } Infinite loop

"""
Curly braces vs do/end
"""
array = [1, 2, 3]
puts array.map { |n| n * 10 }
puts array.map do |n| n * 10 end

"""
times 
"""
5.times { puts "Writing this 5 times!" } # prints Writing this 5 times! 5 times
5.times {|i| puts "I'm on iteration #{i}!" } 
"""
Output
I'm on iteration 0!
I'm on iteration 1!
I'm on iteration 2!
I'm on iteration 3!
I'm on iteration 4!
"""

"""
Custom my times
"""
puts "======================================================"
class Integer
  def my_times
    c = 0
    until c == self
      yield(c)
      c += 1
    end
    self
  end
end

5.my_times {|i| puts "I'm on iteration #{i}!" } 

"""
run the each method on a collection object
"""
puts "======================================================"
array = [1,2,3,4,5] 
array.each {|e| puts "The block just got handed #{e}." }

puts "======================================================"
"""
Custom each on Array
"""
class Array
  def my_each
    c = 0
    until c == size
      yield(self[c])
      c += 1
    end
    self
  end
end
array.my_each {|e| puts "The block just got handed #{e}." }


puts "======================================================"
"""
each v/s map
each returns its receiver, but map returns a new array.
"""
names = ["David", "Alan", "Black"]
puts names.map {|name| name.upcase }
puts "======================================================"
"""
Custom map function
"""
class Array
  def my_map
    c = 0
    acc = []
    until c == size
      acc << yield(self[c])
      c += 1
    end
    acc
  end
end
puts names.my_map {|name| name.upcase }