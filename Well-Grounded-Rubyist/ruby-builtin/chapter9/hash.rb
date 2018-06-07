# creating new Hash
hash = Hash["Connecticut", "CT", "Delaware", "DE" ]
p hash

puts "======================================================="
puts "+++++++++++++++Old entry is overwritten+++++++++++++="
puts "======================================================="
h = Hash.new 
h["a"] = 1 
h["a"] = 2 
puts h["a"]

puts "======================================================="
puts "+++++++++Specifying default values+++++++++++="
puts "======================================================="
h = Hash.new(0)
p h["xyz"] # will give 0

## If you want references to nonexistent keys to cause the keys to come into existence,

h = Hash.new { |hash, key| hash[key] = 0 } ## will add all non-existent key with value 0


puts "======================================================="
puts "+++++++++Combining Hashes with other hashes+++++++++++="
puts "======================================================="
h1 = {"Smith" => "John", "Jones" => "Jane" } 
h2 = {"Smith" => "Jim" } 
h1.update(h2) 
puts h1["Smith"]



puts "======================================================="
puts "+++++++++Hash Transform+++++++++++="
puts "======================================================="
h = { 1 => "one", 2 => "two" }
puts h.invert


puts "======================================================="
puts "+++++++++Hash Clearing+++++++++++="
puts "======================================================="
h.clear
puts h

puts "======================================================="
puts "+++++++++Hash Querying+++++++++++="
puts "======================================================="
h = { 1 => "one", 2 => "two" }
p h.has_key?(1)
p h.include?(1)
p h.key?(1)
p h.member?(1)
p h.has_value?(1)
p h.value?(1)
p h.empty?
p h.size

puts "======================================================="
puts "+++++++++Hash as method Arguments+++++++++++="
puts "======================================================="
# link_to "Click here",
#         :controller => "work", 
#         :action => "show", 
#         :id => work.id


class City
  @name = ''
  @state = ''
  @population = ''
end
def add_to_city_database(name, *info) 
  c = City.new 
  c.name = name 
  c.state = info[:state] 
  c.population = info[:population]
end

add_to_city_database("New York City", 
                    state: "New York", 
                    population: 7000000, 
                    nickname: "Big Apple")