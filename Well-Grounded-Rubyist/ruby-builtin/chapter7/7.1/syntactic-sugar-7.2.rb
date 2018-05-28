x = 1 + 2

x = 1.+(2) # this is eq to the call above

obj = Object.new
def obj.+(other_obj)
  "Trying to add something to me, eh?"
end
puts obj + 100

"""

"""
class Account
  attr_accessor :balance
  def initialize(amount = 0)
    self.balance = amount
  end

  def +(x)
    self.balance += x
  end

  def -(x)
    self.balance -= x
  end

  def to_s
    balance.to_s
  end
end

acc = Account.new(20)
acc -= 5
puts acc

"""
customizing unary operator
"""
puts "==================================================="
puts "+++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "==================================================="
class Banner < String
  def +@
    upcase
  end
  def -@
    downcase
  end
end

banner = Banner.new("Eat at David's!")
puts +banner
puts -banner

class Banner 
  def !
    reverse 
  end 
end

puts !banner
puts (not banner)