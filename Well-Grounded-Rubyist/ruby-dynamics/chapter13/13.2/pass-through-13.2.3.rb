## A pass-through method change involves overriding an existing method in such a way that the original version 
## of the method ends up getting called along with the new version

class String
	alias __old_reverse__ reverse
	def reverse
		$stderr.puts "Reversing a string!" 
		__old_reverse__
	end
end

puts "David".reverse # The first line is printed to STDOUT, and the second line is printed to STDERR.

## Aliasing and its alises
'''
class String
	alias __old_reverse__ reverse
end

class String 
	alias_method :__old_reverse__, :reverse
end
'''

## alias_method needs objects rather than bare method names as its arguments

