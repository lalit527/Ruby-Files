require 'socket'
s = TCPServer.new(3939)
while true
  conn = s.accept
  conn.puts "Hi, Here's the date."
  conn.puts `date`
  conn.close
end