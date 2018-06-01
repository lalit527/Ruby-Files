"""
Nesting controllers so that the parameters to the controllers are managed and understopp by the application.
Example:- 
website lists all messages posted by all users and has the ability to list all the messages posted by a single user 
Single controller for both
"""
class MessageController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @messages = @user.messages
    else
      @message = Message.all
    end
  end
end

# Routes for the above
resources :message
resources :user do
  resources :message
end

"""
Solution use Separate Controllers for Each
controllers/messages_controller.rb
controllers/users/messages_controller.rb
"""
resources :message
resources :user do
  resources :message, :controller => 'users/messages'
end

# controllers/messages_controller.rb 
class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end 
end
  
  # controllers/users/messages_controller.rb 
  class MessagesController < ApplicationController 
    def index 
      @user = User.find(params[:user_id]) 
      @messages = @user.messages 
    end 
  end
