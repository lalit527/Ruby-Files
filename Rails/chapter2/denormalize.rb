## Normalized
class Article < ActiveRecord::Base
  belongs_to :state
  belongs_to :ctegory

  validates :state_id, :presence => true
  validates :categori_id
end

class State < ActiveRecord
  has_many :articles
end

class Category < ActiveRecord::Base
  has_many :articles
end

# the specific set of available states and categories would be
@article.state = State.find_by_name("published")
@article.state = State.published
@article.state == State.published

class State < ActiveRecord::Base
  validates :name, :presence => true

  class << self
    all.each do |state|
      define_method "#{state}" do
      first(:conditions => { :name => state })
      end
    end
  end
end

##Denormalized
class Article < ActiveRecord::Base
  STATES = %w(draft review published archived) 
  CATEGORIES = %w(tips faqs misc)

  validates :state_id, :inclusion => {:in => STATES}
  validates :category, :inclusion => {:in => CATEGORIES}

  STATES.each do |state| 
    define_method "#{state}?" do 
      self.state == state 
    end 
  end

  CATEGORIES.each do |category| 
    define_method "#{category}?" do 
      self.category == category 
    end 
  end

  class << self
    STATES.each do |state| 
      define_method "#{state}" do 
        state 
      end 
    end
    
    CATEGORIES.each do |category| 
      define_method "#{category}" do 
        category 
      end 
    end 
  end
end
