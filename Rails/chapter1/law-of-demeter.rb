class Address < ActiveRecord::Base
  belongs_to :customer
end

class Customer < ActiveRecord::Base
  has_one :address
  has_many :invoices

  def street
    address.street
  end

  def city 
    address.city 
  end

  def state 
    address.state 
  end
    
  def zip_code 
    address.zip_code 
  end
end

class Invoice < ActiveRecord::Base
  belongs_to :customer

  def customer_name
    customer.name
  end
  
  def customer_street 
    customer.street 
  end

  def customer_city 
    customer.city 
  end

  def customer_state 
    customer.state 
  end

  def customer_zip_code 
    customer.zip_code 
  end
end

"""
In the view code
<%= @invoice.customer_name %> 
<%= @invoice.customer_street %> 
<%= @invoice.customer_city %>, 
<%= @invoice.customer_state %> 
<%= @invoice.customer_zip_code %>
"""