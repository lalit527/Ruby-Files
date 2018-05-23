class C
  puts "Just started class C"
  puts self
  module M
    puts "Nested module C::M"
    puts self
  end
  puts "Back in outer level of C"
  puts self
end

class D
  def x
    puts "Class C, method x:"
    puts self ## will print the address of an instance of C
  end
end

d = D.new
d.x 

puts "==================================================="
obj = Object.new
def obj.show_me
  puts "Inside singleton method show_me of #{self}"
end

obj.show_me
puts "Back from call #{obj}"

puts "==================================================="

class E
  def self.x     ### self.x is same as E.x
    puts "Class method of class C"
    puts "self: #{self}"
  end
end

puts "==================================================="

class F
  def F.no_dot
    puts "As long as self is C, we can call this method with no dot"
  end

  no_dot
end

F.no_dot

puts "==================================================="
puts "Calling one instance method from another"
puts "==================================================="

class C
  def x 
    puts "This is method 'x'" 
  end
  def y 
    puts "This is method 'y', about to call x without a dot." 
    x # reference to x is interpreted as a message to be sent to self.
    ## when the method name ends with an equal sign—a setter method, we will have to use object plus dot
  end 
end 
c = C.new 
c.y


puts "==================================================="
puts "Implicit method call"
puts "==================================================="
class Person
  attr_accessor :first_name, :middle_name, :last_name

  def whole_name
    n = first_name + " "
    n << "#{middle_name} " if middle_name
    n << last_name
  end
end

david = Person.new 
david.first_name = "David" 
david.last_name = "Black"
puts "David's whole name: #{david.whole_name}"
david.middle_name = "Alan"
puts "David's new whole name: #{david.whole_name}"

puts "==================================================="
puts "Implicit method call"
puts "==================================================="
"""
every instance variable you’ll ever see in a Ruby program belongs to whatever object 
is the current object (self) at that point in the program.
"""
class C 
  def show_var 
    @v = "I am an instance variable initialized to a string." 
    puts @v 
  end 
  @v = "Instance variables can appear anywhere...."
end
  
C.new.show_var
# C.instance_variable_get(:@v) # to access instance variable

"""
the @v in the method definition B and the @v outside it C are completely unrelated to each other. 
They’re both instance variables, and both are named @v, but they aren’t the same variable. 
They belong to different objects.
The first @v lies inside the definition block of an instance method of C.
The second @v belongs to the class object C.
"""

puts "==================================================="
puts "Relationship btw instance variable and self"
puts "==================================================="
class C
  puts "Just inside class definition block. Here's self:" 
  p self
  @v = "I am an instance variable at the top level of a class body." 
  puts "And here's the instance variable @v, belonging to #{self}:" 
  p @v
  def show_var 
    puts "Inside an instance method definition block. Here's self:"
    p self 
    puts "And here's the instance variable @v, belonging to #{self}:" 
    p @v 
  end 
end
  
c = C.new 
c.show_var