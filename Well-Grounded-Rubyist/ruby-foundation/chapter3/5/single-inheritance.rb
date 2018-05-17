"""
Ruby doesn't support multiple inheritance
"""

"""
In Ruby every object inherit it's properties from 
Object and BasicObject
"""

class C
end

class D < C
end

puts D.superclass  # C
puts D.superclass.superclass  # Object
puts D.superclass.superclass.superclass # BasicObject

puts D.superclass.superclass.superclass.superclass # 

"""
the precedent for BasicObject was a library called BlankSlate
"""