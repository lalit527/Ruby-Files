## Proc don't care if they get right number of arguments
pr = Proc.new {|x| puts "Called with argument #{x}" } 
pr.call(100) # output - Called with argument 100

pr = Proc.new { |x| p x }
# If it’s called with no arguments, its single parameter gets set to nil:
pr.call # output - nil
pr.call(1,2,3) # output 1

## sponge up all the arguments into a single argument with the star (*) operator

pr = Proc.new {|*x| p x } 
pr.call         #output - []
pr.call(1)      #output - [1]
pr.call(1,2)    #output - [1, 2]

"""
If we have
multiple arguments and put the sponge last, it’s assigned an array of all the arguments 
that haven’t been assigned to other variables already.
"""

pr = Proc.new {|x,*y| p x, y } 
pr.call(1,2,3)

## output 1 [2, 3]