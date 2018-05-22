## Kernel module provides an instance method called method_missing

o = Object.new


def o.method_missing(m, *args)
  puts "You can't call #{m} on this object"
end

o.blah

## Method missing with super
class Student
  def method_missing(m, *args)
    if m.to_s.start_with?("grade_for_")
      # return the appropriate grade based on the method
    else
      super
    end
  end
  
end

class Person
  def self.method_missing(m, *args)
    method = m.to_s 
    if method.start_with?("all_with_")
      attr = method[9..-1] 
      if self.public_method_defined?(attr) 
        PEOPLE.find_all do |person| 
          person.send(attr).include?(args[0]) 
        end 
      else 
        raise ArgumentError, "Can't find #{attr}" 
      end 
    else 
      super 
    end 
  end
end