$gvar = "I'm a global!"
class C
  def examine_global
    puts $gvar
  end
end

c = C.new
c.examine_global

puts $0 #current file name

puts $: #directory path

puts $$ # processid

class C 
  a = 5 
  module M 
    a = 4 
    module N 
      a = 3 
      class D 
        a = 2 
        def show_a 
          a = 1 
          puts a 
        end 
        puts a 
      end 
      puts a 
    end 
    puts a 
  end 
  puts a 
end

"""
constants can be defined inside class- and method-definition blocks. 
If you know the chain of nested definitions, you can access a constant from anywhere.
"""
module M 
  class C 
    class D 
      module N 
        X = 1 
      end 
    end 
  end 
end

p M::C::D::N::X

puts "==================================================="
puts "Class Variables"
puts "==================================================="

