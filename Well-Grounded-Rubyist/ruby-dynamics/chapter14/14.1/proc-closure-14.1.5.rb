def talk
	a = "Hello"
	puts a
end

a = "Goodbye"
talk
puts a

def multiply_by(m) 
	Proc.new {|x| puts x * m } 
end

mult = multiply_by(10) 
mult.call(12)