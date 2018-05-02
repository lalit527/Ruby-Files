class D
  # some method and function
end

object = D.new
object.x

## Below is the lookup chain for below
'''
1--
class << object
  include N
end

2--
module N

end

3--
class D < C
	include M
end

4--
module m

end

5--
class C

end

6--
(built-in)
class Object
	include Kernel
end

7--
(built-in)
module Kernel

end

8--
(built-in)
class BasicObject

end
'''