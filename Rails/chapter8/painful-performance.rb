class User < ActiveRecord::Base 
  has_many :comments 
  has_many :articles, :through => :comments 
end

class Article < ActiveRecord::Base 
  has_many :comments 
  has_many :users, :through => :comments 
end

class Comment < ActiveRecord::Base 
  belongs_to :article 
  belongs_to :user 
end

class User < ActiveRecord::Base
  has_many :comments 
  has_many :articles, :through => :comments
  
  def collaborators 
    articles.collect { |a| a.users }.flatten.uniq.reject {|u| u == self } 
  end 
end

## The above can be written using SQL
class User < ActiveRecord::Base
  has_many :comments 
  has_many :articles, :through => :comments
  
  def collaborators 
    User.select("DISTINCT users.*").
      joins(:comments => [:user, {:article => :comments}]).
      where(["article.id in ? AND users.id != ?",
              self.article_ids, self.id])
  end 
end

"""
The resulting Query:-

SELECT DISTINCT users.* FROM users
INNER JOIN comments 
    ON comments.user_id = users.id 
INNER JOIN users users_comments
    ON users_comments.id = comments.user_id 
INNER JOIN articles
    ON articles.id = comments.article_id 
INNER JOIN comments comments_articles
    ON comments_articles.article_id = articles.id 
WHERE (articles.id in (1) AND users.id != 1)
"""