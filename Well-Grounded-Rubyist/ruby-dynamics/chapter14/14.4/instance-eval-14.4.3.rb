p self 
a = [] 
a.instance_eval { p self }

'''
## output 
main 
[]
'''

class C 
  def initialize
    @x = 1
  end
end

c = C.new
c.instance_eval { puts @x }

'''
## Instance eval vs instance exec
dif - exec can take arguments. Any arguments you pass it will be passed, in turn, to the code block.
This enables you to do things like this:

  string = "A sample string" 
  string.instance_exec("s") {|delim| self.split(delim) }
'''