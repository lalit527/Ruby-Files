class User < ActiveRecord::Base
  def_indedx do
    indexes name, login, location, country
  end
end

rake ts:in 
rake ts:start

"""
Cleaning up the code
"""
class UsersController < ApplicationController 
  def index 
    User.search(params[:search], 
    :page => params[:page], 
    :match_mode => :any ) 
  end 
end


"""
By default this will match full-text,
for pattern matching, we need to change:-
  config/sphinx.yml
"""
development:
  enable_star: true 
  min_infix_len: 1

test:
  enable_star: true
  min_infix_len: 1

production:
  enable_star: true 
  min_infix_len: 1

"""
For auto-star each words
"""
def index 
  @users = User.search(params[:search], 
                        :page => params[:page], 
                        :match_mode => :any, 
                        :star => true)
end
