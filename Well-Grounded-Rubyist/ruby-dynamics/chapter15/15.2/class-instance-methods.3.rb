puts String.methods.grep(/methods/).sort

"""
instance_methods returns all public and protected instance methods. 
public_instance_methods returns all public instance methods. 
protected_instance_methods and private_instance_methods return all protected and private instance methods, respectively.
"""

## Instance methods the Range class defines
puts Range.instance_methods(false).sort

## the methods defined in the Enumerable module are overridden in Range?
puts Range.instance_methods(false) & Enumerable.instance_methods(false)