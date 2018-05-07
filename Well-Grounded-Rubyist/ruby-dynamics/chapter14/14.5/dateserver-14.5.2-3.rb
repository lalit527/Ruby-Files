require 'socket'
s = TCPServer.new(3939)
while true
  conn = s.accept
  conn.print "Hi, What's your name?"
  name = conn.get.chomp
  conn.puts "Hi, #{name}. Here's the date."
  conn.puts `date`
  conn.close
end