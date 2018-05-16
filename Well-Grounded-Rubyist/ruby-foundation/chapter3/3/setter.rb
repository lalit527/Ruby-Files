# The equal sign(=) in method names
class Ticket
  def initialize(venue,date,price) 
    @venue = venue 
    @date = date
     @price = price 
  end 

  def price
    @price
  end
end
th = Ticket.new("Town Hall", "11/12/13", 63.00)

class Ticket
  def initialize(venue, date) 
    @venue = venue 
    @date = date 
  end
  
  def set_price(amount)
    @price = amount 
  end
  
  def price 
    @price 
  end 
end

## Syntactic sugar for assignment method
def price=(amount) 
  @price = amount 
end

ticket.price(63.00)

ticket.price = 63.00 # We can use this

## Look at below Issue
class Silly
  def price=(x)
    puts "The current time is #{Time.now}"
  end
end

s = Silly.new
s.price = 111.22
