
Thread.new do
  puts "Starting the thread"
  sleep 1
  puts "At the end of the thread"
end

puts "Outside the thread"

t = Thread.new do
  puts "Starting the thread"
  sleep 1
  puts "At the end of the thread"
end

puts "Outside the thread"
t.join ## if we want to allow the thread to finish executing?