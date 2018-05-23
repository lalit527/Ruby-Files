# <!-- posts/index.html.erb --> 
<% @posts.each do |post| %>
  <h2><%= post.title %></h2> 
  <%= format_content post.body %> 
  <p> 
    <%= link_to 'Email author', mail_to(post.user.email) %> 
  </p> 
<% end %>

# <!-- posts/index.html.erb --> 
<% @posts.each do |post| %> 
  <%= render :partial => 'post', :object => :post %> 
<% end %>

# <!-- posts/_post.erb --> 
<h2><%= post.title %></h2> 
<%= format_content post.body %> 
<p> 
  <%= link_to 'Email author', mail_to(post.user.email) %> 
</p>