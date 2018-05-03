## singleton method on a class object,
# self.method_name
class Car 
	def self.makes 
		%w{ Honda Ford Toyota Chevrolet Volvo } 
	end 
end

# class << self
class Car 
	class << self 
		def makes 
			%w{ Honda Ford Toyota Chevrolet Volvo } 
		end 
	end 
end

# by using extend
module Makers 
	def makes 
		%w{ Honda Ford Toyota Chevrolet Volvo } 
	end 
end

class Car 
	extend Makers 
end

# we can also extend after the class has been created
Car.extend(Makers)

class << Car 
	p ancestors 
end

class Sedan < Car 
	class << self 
		p ancestors 
	end 
end