## Non-ideal view code
<% if current_user && 
      (current_user == @post.user || 
      @post.editors.include?(current_user)) && 
      @post.editable? && 
      @post.user.active? %> 
  <%= link_to 'Edit this post', edit_post_url(@post) %> 
<% end %>

## Ideal view code
<% if @post.editable_by?(current_user) %> 
<%= link_to 'Edit this post', edit_post_url(@post) %> 
<% end %>