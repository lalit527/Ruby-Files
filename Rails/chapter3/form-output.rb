## This code used to be necessary to output a form to the update action
## of a RESTful UserController

<%= form_for :user,
             :url => user_path(@user),
             :html => { :method => :put } do |form| %>
              
  <form action="/users/5" method="post">
    <div style="margin:0;padding:0"> 
      <input name="_method" type="hidden" value="put" /> 
    </div>

## For the new form for a user
<%= form_for :user, :url => users_path do |form| %>

<form action="/users" method="post">

          
