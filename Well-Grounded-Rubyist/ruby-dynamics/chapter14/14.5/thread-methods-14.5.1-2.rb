t = Thread.new do
  puts "[Starting thread]"
  Thread.stop
  puts "[Resuming thread]"
end

puts "Status of thread: #{t.status}"
puts "Is thread stopped: #{t.stop?}"
puts "Is thread stopped: #{t.alive?}"

puts 

puts "Walking up thread Joining it..."
t.wakeup
t.join
puts

puts "Is thread alive? #{t.alive?}"

puts "Inspect string for thread: #{t.inspect}"