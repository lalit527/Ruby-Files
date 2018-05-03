# Additive Changes:- Adding method to Ruby built-in class.
class Array
	def map_with_index
		mapping = []
		each_with_index do |e, i|
			mapping << yield(e, i)
		end
		mapping
	end
end

cardinals = %w{ first second third fourth fifth }
puts [1,2,3,4,5].map_with_index {|n,i| 
	"The #{cardinals[i]} number is #{n}."
}

## Singleton_class method for Object
class Object
	def singleton_class
		class << self
			self
		end
	end
end

class Person
end

david = Person.new
def david.talk
	puts "Hi"
end

dsc = david.singleton_class

if dsc.instance_methods.include?(:talk) 
	puts "Yes, we have a talk method!"
end