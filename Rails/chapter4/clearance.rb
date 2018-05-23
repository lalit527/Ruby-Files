## Clearance plugin for authentication
## http://github.com/thoughtbot/
"""
run script/generate clearance to configure your application for Clearance.
"""
## If we require users to be logged in to access a specific controller or controller action
class WidgetsController < ApplicationController 
  before_filter :authenticate 
  def index 
    @widgets = Widget.all 
  end 
end

# To change any action provided by Clearance
class SessionsController < Clearance::SessionsController 
  def new 
    # your special new behavior 
  end 
end

# Over-ride actions that redirect (create, update and destroy)
class SessionsController < Clearance::SessionsController 
  def url_after_create 
    # your url
  end 
end