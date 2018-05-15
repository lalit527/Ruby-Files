module ToyAssociationMethods
  def cute
    where(:cute => true)
  end
end

class Pet < ActiveRecord::Base
  has_many :toys, extend => ToyAssociationMethods
end

class Owner < ActiveRecord::Base
  has_many :toys, extend => ToyAssociationMethods
end

class PetsController < ApplicationController 
  def show 
    @pet = Pet.find(params[:id]) 
    @toys = @pet.toys.cute 
  end 
end

class Toy < ActiveRecord::Base 
  def self.cute 
    where(:cute => true) 
  end 
end

class Pet < ActiveRecord::Base 
  has_many :toys 
end