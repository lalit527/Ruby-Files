class PetsController < ApplicationController
  def show
    @pet = Pet.find(params[:id])
    @toys = Toy.where(:pet_id => @pet.id, :cute => true)
  end
end

"""
One of the issues with this action is that it’s doing a custom find call
"""

class PetsController < ApplicationController 
  def show 
    @pet = Pet.find(params[:id]) 
    @toys = Toy.find_cute_for_pet(@pet) 
  end 
end

class Toy < ActiveRecord::Base 
  def self.find_cute_for_pet(pet) 
    where(:pet_id => pet.id, :cute => true) 
  end 
end

"""
Fixing with Active record association
"""
class PetsController < ApplicationController 
  def show 
    @pet = Pet.find(params[:id]) 
    @toys = @pet.find_cute_for_pet 
  end 
end

class Pet < ActiveRecord::Base
  has_many :toys
  def find_cute_toys 
    self.toys.where(:cute => true)
  end
end

"""
The has_many line gives you not only the Pet#toys proxy array 
but also all the power and functionality that comes with it
"""
class PetsController < ApplicationController 
  def show 
    @pet = Pet.find(params[:id]) 
    @toys = @pet.toys.cute
  end 
end

class Pet < ActiveRecord::Base
  has_many :toys do
    def cute
      where(:cute => true)
    end
end

"""
pet.toys.cute,
This happens in a single SQL call and is implemented using 
an internal Active Record tool called scope.
"""

