## the highest-up ancestor of every class is BasicObject -- Unless we mix a module into BasicObject
obj = Object.new
puts obj.class.ancestors.last == BasicObject 

'''
BasicObject.new.methods # BasicObject is a class
## NoMethodError: undefined method methods for #<BasicObject:0x39bf48>
'''

print BasicObject.instance_methods(false).sort