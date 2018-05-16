## Automating the creation of attributes

class Ticket
  def initialize(venue, date)
    @venue = venue
    @date = date
  end

  def price=(price)
    @price = price
  end

  def venue
    @venue 
  end

  def date 
    @date
  end

  def price
    @price
  end
end

class Ticket:
  attr_reader :venue, :date, :price
  attr_writer :price

  def initialize(venue, date)
    @venue = venue
    @date = date
  end
end

"""
attr_reader -> reader method
attr_writer -> writer method
attr_accesor -> creater both reader and writer
attr -> creates a reader and optionally writer method(if second argument is true)
"""