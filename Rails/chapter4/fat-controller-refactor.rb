def create_version!(attributes, user)
  if self.versions.empty?
    return create_first_version!(attributes, user) 
  end 
  # mark old related links as not current if self.current_version.relateds.any?
  self.current_version.relateds.each { |rel|
    rel.update_attribute(:current, false) } 
  end
  version = self.versions.build(attributes) 
  version.article_id = self.id 
  version.written_at = Time.now 
  version.writer_id = user.id 
  version.version = self.current_verison.version + 1 
  self.save!
  self.update_attribute(:current_version_id, version.id) 
  version 
end

def create_first_version!(attributes, user) 
  version = self.versions.build(attributes) 
  version.written_at = Time.now 
  version.writer_id = user.id 
  version.state ||= "Raw" 
  version.version = 1 
  self.save!
  self.update_attribute(:current_version_id, version.id) 
  version 
end

########updating the version code
def create_version!(attributes, user)
  if self.versions.empty?
    return create_first_version!(attributes, user) 
  end 
  # mark old related links as not current if self.current_version.relateds.any?
  self.current_version.relateds.each { |rel|
    rel.update_attribute(:current, false) } 
  end
  version = self.versions.build(attributes) 
  version.article_id = self.id 
  version.written_at = Time.now 
  version.writer_id = user.id 
  version.version = self.current_verison.version + 1 
  self.save!
  self.update_attribute(:current_version_id, version.id) 
  version 
end

def create_first_version!(attributes, user) 
  version = self.versions.build(attributes) 
  version.written_at = Time.now 
  version.writer_id = user.id 
  version.state ||= "Raw" 
  version.version = 1 
  self.save!
  self.update_attribute(:current_version_id, version.id) 
  version 
end

"""
"""
class AddRawDefaultToState < ActiveRecord::Migration
  def self.up 
    change_column_default :article_versions, :state, "Raw" 
  end
  
  def self.down 
    change_column_default :article_versions, :state, nil 
  end 
end

"""
Effective Callback Use
Once your migration is in place and has been run, the code looks as follows:
"""
def create_version!(attributes, user)
  if self.versions.empty?
    return create_first_version!(attributes, user) 
  end 
  # mark old related links as not current if self.current_version.relateds.any?
  if self.current_version.relateds.each { |rel|
    self.current_version.relateds.each { |rel|
      rel.update_attribute(:current, false) }
  end
  version = self.versions.build(attributes) 
  version.article_id = self.id 
  version.written_at = Time.now 
  version.writer_id = user.id 
  version.version = self.current_verison.version + 1 
  self.save!
  self.update_attribute(:current_version_id, version.id) 
  version 
end

def create_first_version!(attributes, user) 
  version = self.versions.build(attributes) 
  version.written_at = Time.now 
  version.writer_id = user.id 
  version.state ||= "Raw" 
  version.version = 1 
  self.save!
  self.update_attribute(:current_version_id, version.id) 
  version 
end

"""
The best way to accomplish this functionality is in a callback method on the Version model, 
as shown here:
"""
class Version < ActiveRecord::Base
  before_validation :set_version_number, :on => :create 
  validates :version, :presence => true
  
  private
  def set_version_number 
    self.version = (article.current_version ?
    article.current_version.version : 0) + 1 
  end
end

"""
Once the callback is in place in Version model
"""
def create_version!(attributes, user)
  if self.versions.empty?
    return create_first_version!(attributes, user) 
  end 
  # mark old related links as not current if self.current_version.relateds.any?
  if self.current_version.relateds.each { |rel|
    self.current_version.relateds.each { |rel|
      rel.update_attribute(:current, false) }
  end
  version = self.versions.build(attributes) 
  version.article_id = self.id 
  version.written_at = Time.now 
  version.writer_id = user.id 
  version.version = self.current_verison.version + 1 
  self.save!
  self.update_attribute(:current_version_id, version.id) 
  version 
end

def create_first_version!(attributes, user) 
  version = self.versions.build(attributes) 
  version.written_at = Time.now 
  version.writer_id = user.id 
  version.state ||= "Raw" 
  version.version = 1 
  self.save!
  self.update_attribute(:current_version_id, version.id) 
  version 
end

## To refctor the code, include create_version an create_first_version
def create_version!(attributes, user)
  unless self.versions.empty?
    # mark old related links as not current if self.current_version.relateds.any?
    self.current_version.relateds.each { |rel| 
      rel.update_attribute(:current, false) } 
    end 
  end
  version = self.versions.build(attributes) 
  version.writer_id = user.id 
  self.save!
  self.update_attribute(:current_version_id, version.id) 
  version 
end

class Version < ActiveRecord::Base
  before_validation :set_version_number, :on => :create 
  validates :version, :presence => true
  
  private
  def set_version_number 
    self.version = (article.current_version ?
    article.current_version.version : 0) + 1 
  end

  def mark_related_links_not_current
    unless article.versions.empty?
      if article.current_version.relateds.any?
        article.current_version.relateds.each do |rel| 
          rel.update_attribute(:current, false)
        end
      end
    end
  end
end

"""
Active Record relationship collections on models never return nil if there are no records found. 
Instead, they return an empty collection.
"""

class Version < ActiveRecord::Base
  before_validation :set_version_number, :on => :create 
  validates :version, :presence => true
  
  private
  def set_version_number 
    self.version = (article.current_version ?
    article.current_version.version : 0) + 1 
  end

  def mark_related_links_not_current
    if article.current_verison
      article.current_version.relateds.each do |rel| 
        rel.update_attribute(:current, false)
      end
    end
  end
end

"""
The four occurrences of article.current_version in bold above bring attention to 
the fact that within a version, you’re calling article.current_version several times. 
This duplication alone should prompt you to refactor it, 
so that the concept of what a current version is to a Version is encapsulated.
"""
class Version < ActiveRecord::Base
  before_validation_on_create :set_version_number 
  before_create :mark_related_links_not_current
  
  private

  def current_version 
    article.current_version 
  end

  def set_version_number 
    self.version = (current_version ?
    current_version.version : 0) + 1 
  end

  def mark_related_links_not_current
    if current_verison
      current_version.relateds.each do |rel| 
        rel.update_attribute(:current, false)
      end
    end
  end
end

"""
Here the callback has been refactored to use conditional callbacks:
"""
class Version < ActiveRecord::Base
  before_validation_on_create :set_version_number 
  before_create :mark_related_links_not_current,
                :if => :current_version
  
  private

  def current_version 
    article.current_version 
  end

  def set_version_number 
    self.version = (current_version ? current_version.version : 0) + 1 
  end

  def mark_related_links_not_current
    current_version.relateds.each do |rel| 
      rel.update_attribute(:current, false)
    end
  end
end

"""
Callback after creating record:
"""
class Version < ActiveRecord::Base
  before_validation_on_create :set_version_number 
  before_create :mark_related_links_not_current,
                :if => :current_version
  after_create :set_current_version_on_article
  private
  def set_current_version_on_article 
    article.update_attribute :current_version_id, self.id 
  end
  def current_version 
    article.current_version 
  end

  def set_version_number 
    self.version = (current_version ? current_version.version : 0) + 1 
  end

  def mark_related_links_not_current
    current_version.relateds.each do |rel| 
      rel.update_attribute(:current, false)
    end
  end
end