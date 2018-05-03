require "yaml"
class Hash
	alias __old_set__ []=
	def []=(key, value)
		__old_set__(key, value)
		File.open("hash_contents", "w") do |f| 
			f.puts(self.to_yaml) 
		end 
		value
	end
end

states = {}
states["NJ"] = "New Jersey" 
states["NY"] = "New Yorrk" 
puts File.read("hash_contents") 
puts states["NY"] = "New York" 
puts File.read("hash_contents")