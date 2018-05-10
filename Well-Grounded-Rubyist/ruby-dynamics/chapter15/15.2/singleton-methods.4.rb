class C
end

c = C.new

class << c
  def x
  end

  def y
  end

  def z
  end

  protected :y
  private :z
end

p c.singleton_methods.sort

class << c
  p private_instance_methods(false)
end

puts File.singleton_methods - File.singleton_methods(false)

"""
call to singleton_methods(false) provides only the singleton methods defined on File
The call without the false argument provides all the singleton methods defined on File and its ancestors.
"""

## The superclass of File is IO.

puts IO.singleton_methods(false)