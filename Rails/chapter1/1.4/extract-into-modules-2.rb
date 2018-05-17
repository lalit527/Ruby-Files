# lib/drivable.rb 
module Drivable 
  extend ActiveSupport::Concern
  included  
    validates :direction, :presence => true 
    validates :speed, :presence => true 
  end

  def turn(new_direction) 
    self.direction = new_direction
  end

  def brake 
    self.speed = 0 
  end

  def accelerate 
    self.speed = [speed + acceleration, top_speed].min 
  end

end end

class Bicycle << ActiveRecord::Base 
  include Drivable
  def top_speed 
    20 
  end
  
  def acceleration 
    1 
  end 
  # Other, bike-related activities... 
end

class Car << ActiveRecord::Base 
  include Drivable
  def top_speed 
    100 
  end
  
  def acceleration 
    10 
  end 
  # Other, car-related activities... 
end