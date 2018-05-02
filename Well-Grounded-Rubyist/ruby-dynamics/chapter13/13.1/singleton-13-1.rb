
## A normal method can be accessed by any object of that class
class C
  def talk
    puts "Hi"
  end
end

c = C.new
c.talk # Output Hi


## When we define a singleton method on any object only that object can call the method
## The most common singleton method is the class method
obj = Object.new
def obj.talk
	puts "Hi"
end

obj.talk

## A class method can be defined using self.method_name
class Car 
	def self.makes 
		%w{ Honda Ford Toyota Chevrolet Volvo } 
	end 
end

puts Car.makes

## An object singleton method lives in object singleton Class. Every object has two classes:-
## The class of which it is an instance and the singleton class