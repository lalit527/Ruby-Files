class A
  def a_method 
    puts "Definition in class A" 
  end
end

class B < A
  def a_method 
    puts "Definition in class B" 
  end
end

class C < B
end

c = C.new

c.a_method # Definition in class B

A.instance_method(:a_method).bind(c).call # Definition in class A

class D < C
  def call_original 
    A.instance_method(:a_method).bind(self).call 
  end 
end

d = D.new
d.call_original