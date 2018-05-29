"""
Every Ruby object responds to to_s
Return it's own receiver, when the object is already a string
"""
puts "I am already a String".to_s
puts Object.new.to_s

obj = Object.new
puts obj
puts "My object says: #{obj}"
def obj.to_s
  "I'm an object"
end
puts obj
# the output of to_s when we use an object in string interpolation:
puts "My object says: #{obj}"

puts "======================================================="
puts "++++++++++Inspect Method++++++++++++++++++++++++="
puts "======================================================="
puts obj.inspect ## Will give has value as inspect is not overridden like to_s in line 11
puts obj.to_s

puts "======================================================="
puts "++++++++++Array Method++++++++++++++++++++++++="
puts "======================================================="
"""
a bare list inside the literal array constructor brackets:
[1,2,3,4,5]
It’s a subtle distinction, but the notation lying between the brackets isn’t, itself, an array; 
it’s a list, and the array is constructed from the list, thanks to the brackets.
"""

"""
The star has a kind of bracket-removing or un-arraying effect. 
What starts as an array becomes a list.
"""
array = [1, 2, 3, 4, 5]
puts [*array]

# you can use the star in front of a method argument to turn it from an array into a list
def combine_names(first_name, last_name) 
  first_name + " " + last_name 
end 
names = ["David", "Black"] 
puts combine_names(*names)

puts "======================================================="
puts "++++++++++Numeric Conversion++++++++++++++++++++++++="
puts "======================================================="
"""
Ruby does't automatically convert from string to nubmber,
below will give error
"""
x = "We're number " 
y = 1 
# puts x + y # no implicit conversion of Fixnum into String (TypeError) 


puts "======================================================="
puts "++++++++++Conversion vs Typecasting++++++++++++++++++++++++="
puts "======================================================="
"""
When you call methods like to_s, to_i, and to_f, the result is a new object (or the receiver, if you’re converting it to its own class). 
It’s not quite the same as typecasting in C and other languages. You’re not using the object as a string or an integer; 
you’re asking the object to provide a second object that corresponds to its idea of itself (so to speak) in one of those forms.
"""

puts "======================================================="
puts "++++++++++RolePlaying Method++++++++++++++++++++++++="
puts "======================================================="
"""
String addition
"""
puts "Hello" + " there"

# puts "Hello" + 10

puts "Hello " + 10.to_s

class Person 
  attr_accessor :name
  def to_str 
    name 
  end 
end
david = Person.new
david.name = "David"
# puts david will give object hash
puts "david is name " + david

class Person 
  attr_accessor :name, :age, :email
  def to_ary
    [name, age, email] 
    # [:name, :age, :email]  prints [:name, :age, :email] 
  end 
end
david = Person.new 
david.name = "David" 
david.age = 49 
david.email = "david@wherever"
array = [] 
array.concat(david)
p array
