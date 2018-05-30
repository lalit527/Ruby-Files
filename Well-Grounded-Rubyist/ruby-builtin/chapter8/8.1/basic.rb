text = <<EOM 
This is the first line of text.
This is the second line.
Now we're done.
EOM

puts text


text = <<-EOM 
This is the first line of text.
This is the second line.
Now we're done.
EOM

puts text

# text = <<-'EOM' 
# This is the first line of text.
# This is the second line.
# Now we're done.
# And the literal #{2+2}.
# EOM

puts text

array = [1,2,3, <<EOM, 4] 
This is the here-doc!
It becomes array[3].
EOM

p array

puts "======================================================="
puts "++++++++++++++++Interpolation++++++++++++++++++++++++="
puts "======================================================="

"""
The code inside the curly braces can be anything.
"""
puts "My name is #{class Person  
            attr_accessor :name 
          end 
          d = Person.new 
          d.name = "David" 
          d.name 
          }."

puts "======================================================="
puts "++++++++++++++++String Comparision++++++++++++++++++++++++="
puts "======================================================="
puts "a" == "a"
puts "a".eql?("a")
puts "a".equal?("a")