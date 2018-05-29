"""
Every expression in RUby is either True or False
"""

if (class MyClass; end) 
  puts "Empty class definition is true!"
else 
  puts "Empty class definition is false!" 
end

if (class MyClass; 1; end) 
  puts "Class definition with the number 1 in it is true!" 
else
  puts "Class definition with the number 1 in it is false!" 
end

if (class MyClass; false; end) 
  puts "Class definition with false in it is true!" 
else
  puts "Class definition with false in it is false!" 
end

if (def m; "A call to this method would be 'true'!"; end) 
  puts "Method definition is true!"
else
  puts "Method definition is false!" 
end

if "string" 
  puts "Strings appear to be true!" 
else
  puts "Strings appear to be false!" 
end

if 100 > 50 
  puts "100 is greater than 50!" 
else
  puts "100 is not greater than 50!" 
end

puts "======================================================="
puts "++++++++++Boolean Class name++++++++++++++++++++++++="
puts "======================================================="
puts true.class   # TrueClass
puts false.class  # FalseClass


puts "======================================================="
puts "++++++++++++++++Object Nil++++++++++++++++++++++++="
puts "======================================================="
puts nil.class  # NilClass

"""
It’s all about absence and nonexistence; but nil does exist, and it responds to method calls like other objects:
"""
puts nil.to_s
puts nil.to_i => 0
puts nil.object_id