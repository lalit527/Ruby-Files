string = "Hello There!"
puts string # Hello There!

puts string.gsub!(/zzz/, "xxx")

puts string # Hello There!

puts string.gsub!(/e/, 'E').reverse! # !ErEhT ollEH

puts string # !ErEhT ollEH


## string.gsub!(/zzz/, "xxx").reverse! # undefined method `reverse!' for nil:NilClass

puts "Hello".tap {|string| puts string.upcase }.reverse
## the tap method yields that string back to its code block,

class String 
  alias __old_gsub_bang__ gsub!
	def gsub!(*args, &block) 
		__old_gsub_bang__(*args, &block) 
		self 
	end 
end
string = "Hello There!"
puts string.gsub!(/zzz/, "xxx").reverse!

## We will face The below issue if we change the above gsub behaviour

states = { "NY" => "New York", "NJ" => "New Jersey", "ME" => "Maine" }
string = "Eastern states include NY, NJ, and ME."

if string.gsub!(/\b([A-Z]{2})\b/) { states[$1] }
	puts "Substitution occurred"
else 
	puts "String unchanged"
end