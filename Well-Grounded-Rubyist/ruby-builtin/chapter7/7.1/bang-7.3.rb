"""
The exclamation point (!), or bang, has no significance to Ruby internally; 
bang methods are called and executed just like any other methods. 
But by convention, the bang labels a method as dangerous
"""
str = "Hello"
puts str.upcase # "HELLO"
puts str        # "Hello"
puts str.upcase! # "HELLO"
puts str         # "HELLO"

"""
The ! notation for a method name should only be used when there is a method of the same name without the !, 
when the relation between those two methods is that they both do substantially the same thing, 
and when the bang version also has side effects,
"""