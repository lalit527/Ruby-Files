a = Object.new
b = Object.new

puts a == a
puts a == b
puts a.eql?(a)
puts a.eql?(b)
puts a.equal?(a)
puts a.equal?(b)

puts "======================================================="
puts "++++++++++++++++Classes with comparable++++++++++++++++++++++++="
puts "======================================================="
class Bid
  include Comparable
  attr_accessor :estimate

  def <=>(other_bid)
    if self.estimate < other_bid.estimate
      -1
    elsif self.estimate > other_bid.estimate
      1
    else
      0
    end
  end
end


