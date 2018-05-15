def say_goodbye
  x = "Goodbye"
  puts x
end

def start_here
  x = "Hello"
  puts x
  say_goodbye
  puts "Let's check whether x reminded the same"
  puts x
end

start_here
"""
Output:- 
Hello
Goodbye
Let's check whether x reminded the same
Hello
"""

str = "Hello"
abc = str
str = "Goodbye"
puts str
puts abc

# Output:- Goodbye Hello

