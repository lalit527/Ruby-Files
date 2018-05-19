module Stacklike
  def stack 
    @stack ||= []
  end

  def add_to_stack(obj)
    stack.push(obj)
  end

  def take_from_stack(obj)
    stack.pop
  end
end

## IN the class we need to include this
require "stacklike"
class Stack
  include Stacklike
end