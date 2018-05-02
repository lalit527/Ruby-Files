# when we define a singleton method on an object, no other object can serve as the receiver in a call to that method.
class C 
end
def C.a_class_method 
	puts "Singleton method defined on C" 
end
    
C.a_class_method

class D < C 
end

D.a_class_method

'''
Look up chain follwed above
class C  -----------  singleton class of C
	|												|
	|												|
class D  -----------  singleton class of D
'''
