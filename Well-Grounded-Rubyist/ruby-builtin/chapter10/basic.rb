## Enumerable can be mixed in any class
class C
  include Enumerable
end

class C
  include Enumerable
  def each
    # code
  end
end

## Any class can be made enurable by include each method
class Rainbow
  include Enumerable
  def each
    yield "red"
    yield "orange"
    yield "yellow"
    yield "green"
    yield "blue"
    yield "indigo"
    yield "violet"
  end
end

r = Rainbow.new
r.each do |color|
  puts "Next color: #{color}"
end

puts "======================================================="
puts "+++++++++++++++Enumerable boolean queries+++++++++++++="
puts "======================================================="
p Enumerable.instance_methods(false).sort