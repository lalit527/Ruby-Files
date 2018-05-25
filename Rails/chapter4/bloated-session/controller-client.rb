class OrdersController < ApplicationController 
  def new 
    @order = Order.new 
  end

  def billing 
    @order = Order.find(params[:id])
    if !@order.valid?
      render :action => :new 
    end 
  end
  
  def shipping 
    @order = Order.find(params[:id])
    if !@order.valid?
      render :action => :billing 
    end 
  end
  
  def payment 
    @order = Order.find(params[:id])
    if !@order.valid?
      render :action => :shipping 
    end 
  end
  
  def create 
    @order = Order.find(params[:id])
    if @order.save
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

<h2>Shipping Address</h2> 
<%= form_for @order,
            :url => shipping_order_path, 
            :html => { :method => :post } do 
              <%= form.label :shipping_address %> 
              <%= form.text_field :shipping_address %> 
              <%= form.label :shipping_city %> 
              <%= form.text_field :shipping_city %> 
              <%= form.label :shipping_state %> 
              <%= form.text_field :shipping_state %> 
              <%= form.label :shipping_zip %> 
              <%= form.text_field :shipping_zip %>
              <%= submit_tag %>
              <%= form.hidden_field :billing_address %> 
              <%= form.hidden_field :billing_city %> 
              <%= form.hidden_field :billing_state %> 
              <%= form.hidden_field :billing_zip %> 
            <% end %>
"""

