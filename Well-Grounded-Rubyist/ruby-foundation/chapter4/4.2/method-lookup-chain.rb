class BasicObject 
  # a scant seven method definitions go here 
end

module Kernel 
  # over 100 method definitions go here! 
end
  
class Object < BasicObject 
  # one or two private methods go here, # but the main point is to mix in the Kernel module 
  include Kernel 
end

"""
Its class 
Modules mixed into its class, in reverse order of inclusion 
The class’s superclass 
Modules mixed into the superclass, in reverse order of inclusion 
Likewise, up to Object (and its mix-in Kernel) and BasicObject
"""