"""
Every class is an instance of class called Class
"""
class Ticket
  ## code
end

"""
We can also create class with below syntax
"""
my_class = Class.new

instance_of_my_class = my_class.new

## Creating Annonymous class
c = Class.new do
  def say_hello
    puts "Hello"
  end
end

"""
Message to a class-defination
Ticket.some_message
"""

class Ticket
  # some_message ## attr_accessor 
end


"""
Superclass of Class is Module.
therefore have access to the instance methods defined in Module; 
among these are the attr_accessor family
"""