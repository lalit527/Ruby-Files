a = 1
puts a # 1
t = Thread.new { a = 2 }
t.join
puts a # 2

t = Thread.new { Thread.stop; a = 3 }
# t.join
puts a
t.run
t.join
puts a

t = Thread.new do 
  /(def)/.match("def") 
  puts "$1 in thread: #{$1}" 
end.join

puts "$1 outside thread: #{$1}"