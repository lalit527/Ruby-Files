def talk
  puts "Hello"
end

"""
A method that you define at the top level is stored as a private instance method of the Object class. 
The previous code is equivalent to this:
"""

class Object
  private
  def talk
    puts "Hello"
  end
end

def talk 
  puts "Hello" 
end

puts "Trying 'talk' with no receiver..."
talk 
puts "Trying 'talk' with an explicit receiver..." 
obj = Object.new 
# obj.talk

"""
puts and print are built-in private instance methods of Kernel
To see all private method of Kernel
ruby -e 'print Kernel.private_instance_methods(false).sort'
"""