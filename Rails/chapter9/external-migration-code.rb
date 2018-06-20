class AddJobsCountToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :jobs_count, :integer, :default => 0
    Users.all.each do |user| 
      user.jobs_count = user.jobs.size 
      user.save 
    end
  end

  def self.down 
    remove_column :users, :jobs_count 
  end
end

"""
The code above loads all the users into memory and then for each user, one at a time, it finds out how many jobs each has and updates its count column.

"""

## Using SQL
class AddJobsCountToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :jobs_count, :integer, :default => 0
    updte(<<-SQL)
      UPDATE users SET jobs_count = (
        SELECT count(*) FROM jobs
        WHERE jobs.user_id = user.id
      )
    SQL
  end

  def self.down 
    remove_column :users, :jobs_count 
  end
end

## if we want to use the user-model
class AddJobsCountToUser < ActiveRecord::Migration
  class Job < ActiveRecord::Base
  end
  class User < ActiveRecord::Base
    has_many :jobs
  end
  def self.up
    add_column :users, :jobs_count, :integer, :default => 0
    User.reset_column_information
    Users.all.each do |user| 
      user.jobs_count = user.jobs.size 
      user.save 
    end
  end

  def self.down 
    remove_column :users, :jobs_count 
  end
end