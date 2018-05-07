require 'socket'
s = TCPServer.new(3939)
while (conn = s.accept)
  Thread.new do |c|
    c.print "Hi, What's your name?"
    name = c.get.chomp
    c.puts "Hi, #{name}. Here's the date."
    c.puts `date`
    c.close
  end
end