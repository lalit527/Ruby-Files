class C
end
c = Class.new
c.class_eval do
  def some_method
    puts "Created in class_eval"
  end
end

c = C.new 
# c.some_method

## class_eval puts inside a class-definition body:
'''
When you open a class with the class keyword, you start a new local-variable scope. 
But the block you use with class_eval can see the variables created in the scope surrounding it.
'''
var = "initialized variable"
class D
  puts var
end

## undefined local variable or method `var' for D:Class

D.class_eval { puts var }