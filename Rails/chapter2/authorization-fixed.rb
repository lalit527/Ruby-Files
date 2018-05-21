class User < ActiveRecord::Base
  has_many :roles
end

class Role < ActiveRecord::Base 
  TYPES = %w(admin editor writer guest)
  
  validates :name, :inclusion => { :in => TYPES }

  class << self TYPES.each do |role_type| 
    define_method "#{role_type}?" do 
      exists?(:name => role_type) 
    end 
  end
 end 
end

## The role related attributes are in Role model


### ========================================= ####
class User < ActiveRecord::Base
  has_many :roles

  Role::TYPES.each do |role_type|
    define_method "#{role_type}?" do 
      exists?(:name => role_type) 
    end 
  end
end

class Role < ActiveRecord::Base 
  TYPES = %w(admin editor writer guest)
  
  validates :name, :inclusion => { :in => TYPES }

end