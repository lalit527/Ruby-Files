## Singleton method only this object will respond to this method
def ticket.event 
end

## Insatnce method, all instance will have access to these
class Ticket
  def event
  end
end