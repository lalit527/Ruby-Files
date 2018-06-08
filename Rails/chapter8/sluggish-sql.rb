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