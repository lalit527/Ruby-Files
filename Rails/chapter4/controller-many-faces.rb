## Refactor Non-Restful Actions into Seprate Controller

class UsersController < ApplicationController
  def login
    if request.post?
      if session[:user_id] = User.authenticate(params[:user][:login], params[:user][:password])
        flash[:message] = "Login successful"
        redirect_to_root_url
      else
        flash[:warning] = "Login unsuccessful"
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:message] = "Logged out"
    redirect_to :action => 'login'
  end


end

"""
Resource for session
"""
resource :sessions, :only => [:new, :create, :destroy] 
match "/login" => "user_sessions#new", :as => :login 
match "/logout" => "user_sessions#destroy", :as => :logout
"""
Note that you should use the singular version, resource. A session is a great example of a 
singular resource, as it makes no sense to ask for a listing of sessions, 
and sessions have no concept of a unique identifier.
"""

class SessionsController < ApplicationController
  def new 
    # Just render the sessions/new.html.erb template 
  end
  
  def create 
    if session[:user_id] = User.authenticate(params[:user][:login], params[:user][:password]) 
      flash[:message] = "Login successful" 
      redirect_to root_url 
    else 
      flash.now[:warning] = "Login unsuccessful" 
      render :action => "new" 
    end 
  end
  
  def destroy 
    session[:user_id] = nil 
    flash[:message] = 'Logged out' 
    redirect_to login_url 
  end 
end