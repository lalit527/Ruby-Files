## Authlogic gem for Authenticaton
class UserSession < Authlogic::Session::Base 
  # specify configuration here 
end

# Login specified User
UserSession.create(:login => "bjohnson",
                   :password => "my password", 
                   :remember_me => true)

session = UserSession.new(:login => "bjohnson", 
                          :password => "my password", 
                          :remember_me => true) 

session.save

# requires the authlogic-oid "add on" gem
UserSession.create(:openid_identifier => "identifier", :remember_me => true)

# skip authentication and log the user in directly, 
# the true means "remember me" 
UserSession.create(my_user_object, true)

#We can mix in the authentication functionality directly into User model:

class User < ActiveRecord::Base 
  acts_as_authentic 
end

"""
Authlogic doesn’t provide controllers and views in its standard distribution. 
You have to create them by hand or copy them from the sample application provided by Authlogic.
"""