class User < ActiveRecord::Base 
  has_and_belongs_to_many :roles, :uniq => true
  def has_role?(role_in_question) 
    self.roles.first(:conditions => { :name => role_in_question }) ? true : false 
  end
  
  def has_roles?(roles_in_question) 
    roles_in_question = self.roles.all(:conditions => ["name in (?)", roles_in_question])
    roles_in_question.length > 0 
  end
  
  def can_post?
   self.has_roles?(['admin', 'editor', 'associate editor', 'research writer']) 
  end
  
  def can_review_posts?
    self.has_roles?(['admin', 'editor', 'associate editor']) 
  end
  
  def can_edit_content?
    self.has_roles?(['admin', 'editor', 'associate editor']) 
  end
  
  def can_edit_post?(post) 
    self == post.user || self.has_roles?(['admin', 'editor', 'associate editor']) 
  end 
end

class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates_presence_of :name
  validates_uniqueness_of :name

  def name=(value)
    write_attribute("name", value.downcase)
  end

  def self.[](name)
    self.find(:first, :conditions => ["name = ?", name.id2name])
  end

  def add_user(user)
    self.users << user
  end

  def delete_user(user)
    self.users.delete(user)
  end

end