p Object.new.methods.sort

puts "The id of obj is #{obj.object_id}."
str = "Strings are objects too, and this is a string!"
puts "The id of the string object str is #{str.object_id}." 
puts "And the id of the integer 100 is #{100.object_id}.

obj = Object.new
if obj.responds_to?("talk")
  obj.talk
else
  puts "Sorry, the object doesn't understand talk messagee"

"""
send is a very broad concept, so a programmer might defined method 
with name as send
Ruby also has __send__ and public_send
public_send:- Only public methods
"""