def Ticket.most_expensive(*tickets)
  tickets.max_by(&:price)
end

th = Ticket.new("Town Hall","11/12/13") 
cc = Ticket.new("Convention Center","12/13/14/") 
fg = Ticket.new("Fairgrounds", "13/14/15/")
th.price = 12.55 
cc.price = 10.00 
fg.price = 18.00
highest = Ticket.most_expensive(th,cc,fg)

puts "The highest-priced ticket is the one for #{highest.venue}."

class Temperature
  def Temperature.c2f(f)
    f * 9.0 / 5 + 32
  end

  def Temperature.f2c(c)
    (c- 32) * 5 / 9.0
  end
end

"""
Refering to Ruby Methods outside the code,
Ticket#price refers to the instance method price in the class Ticket
Ticket.most_expensive refers to the class method most_expensive in the class Ticket
Ticket::most_expensive also refers to the class method most_expensive in the class Ticket
"""