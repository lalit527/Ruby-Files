## For proc object we always supply a code block. But not every code
## block serves as the basis of proc.

[1, 2, 3].each { |x| puts x*10 }
# Above statement involves a code block but does not create a proc


def call_a_proc(&block)
	block.call
end

call_a_proc { puts "I'm the block.. or Proc.. or something" }

## block or proc can be served in place of code block in a method call
p = Proc.new { |x| puts x.upcase }
%w{ David Blck }.each(&p)