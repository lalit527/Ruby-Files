puts eval("2 + 2")

## “How do I write a method and give it a name someone types in?”
print "Method name"
m = gets.chomp
eval("def #{m}; puts 'Hi!'; end")
eval(m)

"""
eval gets a binding argument the top-level binding, in which str is defined and bound.
"""
def use_a_binding(b) 
  eval("puts str", b) 
end
str = "I'm a string in top-level binding!" 
use_a_binding(binding)