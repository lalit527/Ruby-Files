class Car << ActiveRecord::Base
  validates :speed, :presence => true
  def turn(new_direction) 
    self.direction = new_direction 
  end
  def brake 
    self.speed = 0 
  end
  def accelerate 
    self.speed = speed + 10 
  end
end

class Bicycle << ActiveRecord::Base
  validates :direction, :presence => true 
  validates :speed, :presence => true
  def turn(new_direction) 
    self.direction = new_direction 
  end
  def brake 
    self.speed = 0 
  end
  def accelerate 
    self.speed = speed + 10 
  end
end

# lib/drivable.rb module Drivable
module Drivable
  def turn(new_direction) 
    self.direction = new_direction 
  end

  def brake 
    self.speed = 0 
  end
  
  def accelerate 
    self.speed = speed + 10 
  end 
end

class Car << ActiveRecord::Base 
  validates :direction, :presence => true 
  validates :speed, :presence => true 
  include Drivable 
  # Other, car-related activities...
end

class Bicycle << ActiveRecord::Base 
  validates :direction, :presence => true 
  validates :speed, :presence => true 
  include Drivable
   # Other, bike-related activities...
end

"""
For automatically requiring files
#config/initializers/requires.rb 
Dir[File.join(Rails.root, 'lib', '*.rb')].each 
  do |f| 
  require f 
end
"""