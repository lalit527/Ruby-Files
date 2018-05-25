if 'condition'
  # code here
  puts 'condition'
end

"""
if 'condition1'
  puts 'condition'
elsif 'condition2'
  puts 'condition2'
else
  puts 'else'
end
"""

"""
Negeting Condition:
if not (condition1==1)

if !(condition1==1)

if not condition1 == 1

if !condition1 == 1 ## eq to if (!condition1) == 1
"""

"""

"""
x = 1

unless x == 2
  puts "cool"
else 
  puts "check"
end

puts "======================================================"
if false
  z = 2
end
p z # print nil

puts "======================================================"
if x = 1
  puts "Hi!"
end
# warning: found = in conditional, should be ==
# if x = y No warning as both sides are variable

## Case Statement
puts "======================================================"

case 
  when user.first_name == "David", user.last_name == "Black"
    puts "You might be David Black." 
  when Time.now.wday == 5
    puts "You're not David Black, but at least it's Friday!" 
  else
    puts "You're not David Black, and it's not Friday." end
