class OrdersController < ApplicationController 
  def new 
    session[:order] = Order.new 
  end

  def billing 
    session[:order].attributes = params[:order] 
    if !session[:order].valid?
      render :action => :new 
    end 
  end
  
  def shipping 
    session[:order].attributes = params[:order] 
    if !session[:order].valid?
      render :action => :billing 
    end 
  end
  
  def payment 
    session[:order].attributes = params[:order] 
    if !session[:order].valid?
      render :action => :shipping 
    end 
  end
  
  def create 
    if session[:order].save 
      flash[:success] = "Order placed successfully" 
      redirect_to order_path(session[:order]) 
    else 
      render :action => :payment 
    end 
  end
  
  def show 
    @order = Order.find params[:id] 
  end 
end

"""
The order being used is stored in the session, and is being used in each step.
Resource for the above appear as follows:
resources :post do
  collection do
    post :shipping 
    post :billing 
    posft :payment
  end
end

URL's as user process throught the order
/orders/new 
/orders/shipping 
/orders/billing 
/orders/payment 
/orders/1
"""

