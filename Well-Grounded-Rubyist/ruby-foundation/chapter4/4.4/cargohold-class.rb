class Stack
  attr_reader :stack
  def initialize
    stack = []
  end

  def add_to_stack(obj)
    @stack.push(obj) 
  end

  def take_from_stack 
    @stack.pop 
  end

  class Test

  end
end

class Suitcase
end

s= Stack::Test
"""
Modules don’t have instances
A class can have only one superclass, but it can mix in as many modules as it wants.
"""

"""
We can nest many classes in a module
"""
module Test
  class A
  end
  class B
  end
  class C
  end
end