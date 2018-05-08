d = open("|cat", "w+")
puts d.puts "Hello World"

puts d.gets

d.close

open("|cat", "w+") {|p| puts p.puts("hi"); puts p.gets }