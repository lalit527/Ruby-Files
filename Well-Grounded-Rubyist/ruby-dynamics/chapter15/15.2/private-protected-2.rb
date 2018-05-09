#object = Object.new
#puts object.private_methods. # defined as private instance methods of the Kernel module
#puts object.protected_methods.size

class Person
  attr_reader :name
  def name=(name)
    @name = name
    normalize_name
  end

  private
  def normalize_name
    name.gsub!(/[^-a-z'.\s]/i, "")
  end
end

david = Person.new 
david.name = "123David!! Bl%a9ck" 
raise "Problem" unless david.name == "David Black"
puts "Name has been normalized."
p david.private_methods.sort.grep(/normal/)