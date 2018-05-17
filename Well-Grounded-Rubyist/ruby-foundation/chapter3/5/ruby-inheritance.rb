class Publication
  attr_accessor :publisher
end

class Magazine < Publication
  attr_accessor :editor
end

mag = Magazine.new
mag.publisher = "David A. Black"
mag.editor = "Joe Smith"

class Ezine < Magazine

end

class Person
  def species
    "Homo sapiens"
  end
end

class Rubyist < Person

end

david = Rubyist.new
puts david.species