class Song < ActiveRecord::Base
  def self.search(title, artist, genre, 
                  published, order, limit, page) 
    condition_values = { :title => "%#{title}%", 
                         :artist => "%#{artist}%", 
                         :genre => "%#{genre}%"}

    case order 
    when "name": order_clause = "name DESC" 
    when "length": order_clause = "duration ASC"
    when "genre": order_clause = "genre DESC"
    else 
      order_clause = "album DESC" 
    end

    joins = []
    conditions = []
    conditions << "(title LIKE ':title')" unless title.blank? 
    conditions << "(artist LIKE ':artist')" unless artist.blank? 
    conditions << "(genre LIKE ':genre')" unless genre.blank?
    unless published.blank?
      conditions << "(published_on == :true OR published_on IS NOT NULL)" 
    end
    find_opts = { :conditions => [conditions.join(" AND "), 
                                  condition_values], 
                  :joins => joins.join(' '), 
                  :limit => limit, 
                  :order => order_clause }
      
      page = 1 if page.blank?
      paginate(:all, find_opts.merge(:page => page, 
                                     :per_page => 25)) 
  end
end