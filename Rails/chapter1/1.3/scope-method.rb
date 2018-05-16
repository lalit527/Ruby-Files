class RemoteProcess < ActiveRecord::Base
  def self.find_top_running_processes(limit = 5)
    find(:all,
         :conditions => "state = 'Running'",
         :order => "percent_cpu desc",
         :limit => limit)
  end

  def self.find_top_running_syetm_processes(limit = 5)
    find(:all, 
         :conditions => "state = 'Running' and 
                        (owner in ('root', 'mysql')", 
         :order => "percent_cpu desc", 
         :limit => limit)
  end
end

## Scopes are an implementation of the Virtual Proxy design pattern,

class RemoteProcess < ActiveRecord::Base
  scope :running, where(:state => 'Running') 
  scope :system, where(:owner => ['root', 'mysql']) 
  scope :sorted, order("percent_cpu desc") 
  scope :top, lambda {|l| limit(l) }
end

RemoteProcess.running.sorted.top(10) 
RemoteProcess.running.system.sorted.top(5)

## Below is the more traditional version
class RemoteProcess < ActiveRecord::Base 
  def self.running 
    where(:state => 'Running') 
  end

  def self.system 
    where(:owner => ['root', 'mysql']) 
  end
  
  def self.sorted 
    order("percent_cpu desc") 
  end
  
  def self.top(l) 
    limit(l) 
  end 
end

## Finder with scopes and arbitary function
class RemoteProcess < ActiveRecord::Base
  scope :running, 
  where(:state => 'Running') 
  scope :system, where(:owner => ['root', 'mysql']) 
  scope :sorted, order("percent_cpu desc") 
  scope :top, lambda {|l| limit(l) }
  
  def self.find_top_running_processes(limit = 5) 
    running.sorted.top(limit) 
  end
  
  def self.find_top_running_system_processes(limit = 5) 
    running.system.sorted.top(limit) 
  end 
end