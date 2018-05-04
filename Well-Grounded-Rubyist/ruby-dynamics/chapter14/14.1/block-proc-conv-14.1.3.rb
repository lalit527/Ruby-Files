def capture_block(&block)
	puts "Got block as Proc"
	block.call
end
capture_block { puts "Inside the block" }

'''
This is an implicit Proc.new using same block

capture_block { puts "Inside the block" } --- 1
Proc.new { puts "Inside the block" } ---- 2
proc in step 2 is passed a parameter value to &block

def capture_block(&block) ---- 3
	puts "Got block as Proc"
	block.call
end
'''

## calling capture block with a proc instead of block
p = Proc.new { puts "This proc argument will serve as a code block." } 
capture_block(&p)

# capture_block(&p) { puts "This is the explicit block" } 
# Results in error both block arg and actual block given
'''
capture_block(p)
capture_block(p.to_proc)
'''

'''
The & in capture_block(&p) does two things
- Triggers a call to p to_proc method
- Tells Ruby that the resulting Proc Object is serving as a code
	block stand-in
'''
