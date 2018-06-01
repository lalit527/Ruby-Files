"""
Instance of class Exception or a descendent of that class
"""
print "Enter a number"
n = gets.to_i
begin
  result = 100 / n
rescue
  puts "Your number did't work. Was it zero???"
  exit
end

puts "100/#{n} is #{result}"

"""
File handling error
"""
def open_user_file
  print "File to open: "
  filename = gets.chomp
  begin
    fh = File.open(filename)
  rescue  
    puts "Couldn't open your file!"
    return
  end
  yield fh
  fh.close
end

"""
Raising exception explicitly
"""
def fussy_method(x)
  raise ArgumentError, "I need a number under 10" unless x < 10
end

begin
  fussy_method(20)
rescue
  puts "That was not an acceptable number!"
end

"""
A nice tweak is that if you give raise a message as the only argument, rather than as the second argument 
where an exception class is the first argument, raise figures out that you want it to raise a 
RuntimeError using the message provided. These two lines are equivalent:
############################
  raise "Problem!"
  raise RuntimeError, "Problem!"
############################
"""

"""
Capturing an exception in a rescue clause
"""
begin 
  fussy_method(20) 
rescue ArgumentError => e 
  puts "That was not an acceptable number!"
  puts "Here's the backtrace for this exception:" 
  puts e.backtrace 
  puts "And here's the exception object's message:" 
  puts e.message 
end

## What gets raised: an exception or an exception class?
"""
The language of exception raising is class based: raise ZeroDivisionError 
rather than raise ZeroDivisionError.new. But really, instances of the exception classes 
are raised. The syntax lets you raise a class because that looks better and abstracts away the fact 
that instantiation is involved.
"""
begin 
  raise ArgumentError 
rescue => e 
  p e.class ArgumentError 
end
## The object’s class is ArgumentError; the object itself is an instance of ArgumentError, 
## not the class ArgumentError.

"""
Re-Raising an exception
"""
begin 
  fh = File.open(filename) 
rescue => e
  logfile.puts("User tried to open #{filename}, #{Time.now}")
  logfile.puts("Exception: #{e.message}")
  raise 
end


"""
Ensure clause
"""
def line_from_file(filename, pattern)
  fh = File.open(filename) 
  begin 
    line = fh.gets 
    raise ArgumentError unless line.include?(pattern) 
  rescue ArgumentError 
    puts "Invalid line!"
    raise 
  ensure 
    fh.close 
  end 
  return line 
end

"""
Creating Custom Exception
"""
class MyNewException < Exception
end

begin
  puts "About to raise exception"
  raise MyNewException
rescue MyNewException => e
  puts "Just raised an exception: #{e}"
end

class InvalidLineError < StandardError
end

def line_from_file(filename, pattern) 
  fh = File.open(filename) 
  line = fh.gets 
  raise InvalidLineError unless line.include?(pattern) 
  return line 
  rescue InvalidLineError 
    puts "Invalid line!"
    raise 
  ensure 
    fh.close
end

"""
Exception class can be namespaced in an module
"""
module TextHandler 
  class InvalidLineError < StandardError 
  end 
end