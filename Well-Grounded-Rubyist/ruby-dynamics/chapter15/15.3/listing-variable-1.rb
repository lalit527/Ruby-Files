x = 1
p local_variables # refers to all local variables

p global_variables # refers to all the global variables

"""
local_variables and global_variables don’t give you the values of the variables they report on; 
they just give you the names. The same is true of the instance_variables method
"""

class Person
  attr_accessor :name, :age

  def initialize(name)
    @name = name
  end
end


david = Person.new("David")
david.age = 49

p david.instance_variables