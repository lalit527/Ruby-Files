class Person
    attr_accessor :name
end

david = Person.new 
david.name = "David" 
matz = Person.new 
matz.name = "Matz" 
ruby = Person.new 
ruby.name = "Ruby"

def david.name 
    "[not available]" 
end