def talk
	a = "Hello"
	puts a
end

a = "Goodbye"
talk
puts a

## The identifier a has been assigned to twice, but the two assignments are unrelated to each other.


m = 10 
[1,2,3].each {|x| puts x * m }

## that code blocks preserve the variables that were in existence at the time they were created

def multiply_by(m) 
	Proc.new {|x| puts x * m } 
end

mult = multiply_by(10) 
mult.call(12)

## The variable m value is preserved
## and serves as multiplier to Proc object returned from multiply_by is called.