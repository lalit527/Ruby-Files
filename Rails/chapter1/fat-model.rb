class Order < ActiveRecord::Base
  
  def self.find_purchased
    # ...
  end

  def self.find_waiting_for_review 
    # ...
  end

  def self.find_waiting_for_sign_off # ...

  end
  
  def self.find_waiting_for_sign_off 
    # ...
  end
  
  def self.advanced_search(fields, options = {}) 
    # ...
  end

  def self.simple_search(terms) 
    # ...
  end
  
  def to_xml
     # ... 
  end
  
  def to_json 
    # ...
  end
  
  def to_csv 
    # ... 
  end
  
  def to_pdf 
    # ...
  end
end

## solution to get rid of fat model
class Order < ActiveRecord::Base
  def to_xml
    # ... 
  end
  
  def to_json 
    # ...
  end
  
  def to_csv 
    # ... 
  end
  
  def to_pdf 
    # ...
  end
end

## Using Single Responsibility Principle
class Order < ActiveRecord::Base
  def converter
    OrderConverter.new(self)
  end 
end

class OrderConverter
  attr_reader :order 
  def initialize(order) 
    @order = order 
  end
  
  def to_xml 
    # ... 
  end
  
  def to_json 
    # ...
  end
  
  def to_csv 
    # ... 
  end
  
  def to_pdf 
    # ...
  end 
end

"""
For exporting PDF version of an order
"""
@order.converter.to_pdf

## The chaining above breaks the law of demeter
## Use delegation to fix the issue
class Order < ActiveRecord::Base
  delegate :to_xml, :to_json, :to_csv, :to_pdf, :to => :converter
  def converter
    OrderConverter.new(self)
  end
end
@order.to_pdf

## Using Modules
