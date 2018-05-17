class Song < ActiveRecord::Base
  def self.top(number)
    limit(number)
  end

  def self.matching(column, value)
    where(["#{column} like ?", "%#{value}"])
  end

  def self.published
    where(["published_on is not null"])
  end

  def self.order(col)
    sql = case col
            when "name": "name desc"
            when "length": "duration asc" 
            when "genre": "genre desc" 
            else "album desc"
          end
    order(sql)
  end
  
  def self.search(title, artist, genre, published) 
    finder = matching(:title, title) 
    finder = finder.matching(:artist, artist) 
    finder = finder.matching(:genre, genre) 
    finder = finder.published unless published.blank? 
    return finder 
  end
end

Song.search("fool", "billy", "rock", true).
      order("length").
      top(10).
      paginate(:page => 1)


"""
The above code using scope
"""
class Song < ActiveRecord::Base
  has_many :uploads 
  has_many :users, :through => :uploads
  # top and order are implemented the same as before, 
  # using named_scope...
  def self.search(title, artist, genre, published) 
    finder = where(["title like ?", "%#{title}%"]) 
    finder = finder.where(["artist like ?", "%#{artist}%"]) 
    finder = finder.where(["genre like ?", "%#{genre}%"]) 
    unless published.blank?
      finder = finder.where("published_on is not null") 
    end 
    return finder 
  end 
end