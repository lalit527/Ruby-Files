puts "======================================================="
puts "+++++++++++++++Adding foreign key+++++++++++++="
puts "======================================================="
class User < ActiveRecord::Base
  has_many :comments
end

puts "======================================================="
puts "++Polymorphic relationship between comments and tags+++="
puts "======================================================="
class Tag < ActiveRecord::Base
  has_many :taggings
end

class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :taggable, :polymorphic => true
end

class Comment < ActiveRecord::Base
  has_many :taggings, :as => :taggable
end

"""
SELECT * FROM comments
INNER JOIN taggings
ON taggings.taggable_type = 'Comment' 
AND taggings.taggable_id = '3'
INNER JOIN tags
ON taggings.tag_id = tags.id

"""

class AddindexesToAllPolymorphicTables < ActiveRecord::Migration
  def self.up
    add_index :taggings, :tag_id
    add_index :taggings, [:taggable_id, :taggable_type]
  end
  def self.down
    remove_index :taggings, :column => [:taggable_id, :taggable_type]
    remove_index :taggings, :tag_id
  end
end

class User < ActiveRecord::Base
  validates :email, :unique => true
end


puts "======================================================="
puts "++Reassess your Domain Model+++="
puts "======================================================="
class State < ActiveRecord::Base
  validates :name, :unique => true
end

class User < ActiveRecord::Base
end

class Article < ActiveRecord::Base
  belongs_to :state
  belongs_to :categories
  belongs_to :user
end

"""
In order to query the articles of a particular state, category, and user:

SELECT * FROM articles
  LEFT  OUTER JOIN states ON articles.state_id=states.id
  LEFT  OUTER JOIN categories ON articles.category_id=categories.id
WHERE articles.category_id == categories.id
  AND states.name = 'published'
  AND categories.name = 'hiking'
  AND articles.user_id = 123

"""
# ActiveRecod Query
Article.includes([:state, :category]).
  where("states.name" => "published",
        "categories.name" => "hiking",
        "articles.user_id" => current_user)

'''
SELECT * from articles 
WHERE state_id = 150
AND category_id = 50
AND user_id = 123

published_state = State.find_by_name("published") 
hiking_category = Category.find_by_name("hiking") 
Article.where("state_id" => published_state,
"category_id" => hiking_category, "user_id" => current_user)
'''

puts "======================================================="
puts "++The N+1 problem+++="
puts "======================================================="
# Instead of querying for each recod in the table loading each record 
# perfom eager loading
Article.includes([:state, :category, :user])

puts "======================================================="
puts "++Denormalized Dataset+++="
puts "======================================================="
class Article < ActiveRecod::Base
  STATES = %w(draft review published archived)
  CATEGORIES = %w(tips faqs misc hiking)

  validates :state, :inclusion => {:in => STATES }
  validates :category, :inclusion => {:in => CATEGORIES}
end

## New query pulls out of single table
Article.where("state" => "published",
              "category" => "hiking",
              "user_id" => current_user)

current_user.articles.find_all_by_state_and_category("published", "hiking")
