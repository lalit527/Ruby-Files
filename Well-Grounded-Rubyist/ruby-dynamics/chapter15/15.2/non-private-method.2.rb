# string = "Test string"
# puts string.methods.grep(/case/).sort

# puts string.methods.grep(/.!/).sort
string = "Test string"
methods = string.methods
bangs = string.methods.grep(/.!/)
def string.surprise!
end
unmatched = bangs.reject do |b|
  methods.include?(b[0..-2].to_sym)
end
puts unmatched
if unmatched.empty?
  puts "All bang methods are matched by non-bang methods"
else
  puts "Some  bang methods have non-bang methods"
  puts unmatched
end

# puts string.methods.grep(/.!/).sort