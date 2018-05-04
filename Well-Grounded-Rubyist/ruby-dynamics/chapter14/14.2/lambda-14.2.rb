lam = lambda { puts "A lamda!" }
lam.call

"""
1) Lamda require explicit creation, ruby can implicitly create procs but not lambda
2) Return inside lamda triggers an exit from the body of lambda to th
    code context immediately containing the lambda, return inside proc triggers a return
		from the method in which the proc is being executed
3) Lamda can't be called with wrong number of arguments
"""

def return_test
	l = lambda { return }
	l.call
	puts "Still Here!"
	p = Proc.new { return }
	p.call
	puts "You won't see this message"
end
return_test

## calling a proc that contains return when you’re not inside any method produces a fatal error.
# Proc.new { return }.call # unexpected return

lam = lambda {|x| p x }
lam.call(1)
lam.call