"""
Set Timeouts.
Default timeout of standard Net::HTTP -> 60 seconds
"""
request = Net::HTTP::Post.new(url.path)
request.set_form_data({'xml' => xml})
http = Net::HTTP.new(url.host, url.port).start
http.read_timeout = 3
response = http.request(req)

"""
Moving Task to the Background 
"""
class SendOrderJob < Struct.new(:messsage, :action_links)
  def perform(order)
    OrderSender.send_order(order)
  end
end 

def create
  Delayed::Job.enqueue SendOrderJob.new(order)
end