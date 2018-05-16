class Ticket
  def initilialize
    puts "Creating new ticket!"
  end
end


class Ticket
  def initilialize(venue, date)
    @venue = venue
    @date = date
  end

  def venue
    @venue
  end

  def date
    @date
  end
end