class C 
  def talk
    puts "Method-grabbing test! self i #{self}"
  end
end

c = C.new
meth = c.method(:talk)

meth.call

class D < C 

end

d = D.new
unbound = meth.unbind
unbound.bind(d).call

## This single line is equivalent to a method call plus an unbind call:
unbound = C.instance_method(:talk)