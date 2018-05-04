pr = Proc.new { puts "Inside a Proc's block" }

pr.call

## procs are objects. That means we can assign them to variables, 
## put them inside arrays, send them around as method arguments, 
## and generally treat them as you would any other object.

'''
The proc method takes a block and returns a Proc Object
'''

proc { puts "Hi!" }

# above can be used instead of the below proc call
Proc.new { puts "Hi!" }