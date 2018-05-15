class Order < ActiveRecord::Base
  extend OrderStateFinders
  extend OrderSearchers
  include OrderExporters
end

module OrderStateFinders
  def find_purchased
    # ...
  end
  def find_waiting_for_review 
    # ...
  end
  
  def find_waiting_for_sign_off # ...
    # ...
  end
  def find_waiting_for_sign_off # ...
    # ...
  end
end

module OrderSearchers
  def advanced_search(fields, options = {}) 
    # ...
  end
  
  def simple_search(terms) 
    # ...
  end 
end

module OrderExporters

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


Dir[File.join(Rails.root, 'lib', '*.rb')].each do |f| 
  require f 
end