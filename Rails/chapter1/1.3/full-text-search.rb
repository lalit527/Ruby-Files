"""
The following is an example of a common search approach that involves searching for results 
that match any of the words provided in any of the specified columns:
"""

class User < ActiveRecord::Base
  def self.search(terms, page)
    columns = %w(  name login location country )
    tokens = terms.split(/\s+/)
    if tokens.empty?d
      conditions = nil
    else
      conditions = tokens.collect do |token|
        columns.collect do |column|
          "#{column} LIKE '%#{connection.quote(token)}%'"
        end
      end
    end
  end
end

class UserController < ApplicationController
  def index
    @users = User.search(params[:search], params[:page])
  end
end