require 'socket'
s = TCPServer.new(3939)
conn = s.accept
conn.puts "Hi, Here's the date."
conn.puts `date`
conn.close