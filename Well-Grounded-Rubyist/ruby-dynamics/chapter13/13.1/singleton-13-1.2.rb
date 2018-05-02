## Singleton classes are annonymous
# Altough they are class object, they spring up automatically without being given a name
# We can open class -definition of a singleton class and add instance methods, class methods and constants

class C
  # method and constant definitions here
end

# to get into the definition body of singleton class

class << Object # << object notation means the anonymous, singleton class of object.
  # method and constant definitions here
end

## When you’re inside the singleton class definition body, you can define methods—and these methods 
## will be singleton methods of the object whose singleton class you’re in.

str = "I am a string"
class << str
	def twice
		self + " " + self
	end
end

puts str.twice

## def obj.method v/s class << obj; def meth

# If you have a top-level constant N, you can also define an N inside an object’s singleton class:

N = 1 
obj = Object.new 
class << obj 
	N = 2 
end

def obj.a_method 
	puts N 
end

class << obj 
	def another_method 
		puts N 
	end 
end 
obj.a_method 
obj.another_method

# DEFINING CLASS METHODS WITH CLASS <<
class Ticket 
	class << self 
		def most_expensive(*tickets) 
			tickets.max_by(&:price) 
		end 
	end 
end 

# creation of class method Ticket.most_expensive
# same method in other way 
'''
## 
def Ticket.most_expensive(*tickets)

## 
class << Ticket
	def most_expensive(tickets)

	end
end		
'''