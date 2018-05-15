obj = Object.new

def obj.one_arg(x)
  puts "I require one and only one argument!"
end

# obj.one_arg(1, 2, 3) # Throws ArgumentError

def obj.multi_arg(x)
  puts "I can take zero or more arguents"
end

def obj.two_or_more(a, b, *c)
  puts "Require Two Argument"
  puts "And sure enough, I got:"
  p a, b, c
end

obj.two_or_more(1,2,3,4,5)