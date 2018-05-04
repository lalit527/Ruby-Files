puts %w{ david black }.each(&:capitalize)

# the above &:capitalize will be converted to below
puts %w{ david black }.each {|str| str.capitalize }

# the above is same as below
puts %w{ david black }.each {|str| str.send(:capitalize) }

# :capitalize is a symbol and & is a to_proc trigger

# Symbol#to_proc 

class Symbol 
	def to_proc       
		puts "In the new Symbol#to_proc!" 
		Proc.new {|obj| obj.send(self) } 
	end 
end

puts %w{ david black }.map(&:capitalize)