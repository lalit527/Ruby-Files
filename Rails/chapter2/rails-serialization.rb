class User < ActiveRecord::Base
  has_many :referral_types
end

class Referral < ActiveRecord::Base 
  has_and_belongs_to_many :users 
end

## Using Has many
class User < ActiveRecord::Base
  has_many :referral_types 
end

class Referral < ActiveRecord::Base
  VALUES = ['Newsletter', 'School', 'Web', 'Partners/Events', 'Media', 'Other'] 
  validates :value, :inclusion => {:in => VALUES}
  
  belongs_to :user 
end

## Using Serialize
class User < ActiveRecord::Base 
  HEARD_THROUGH_VALUES = ['Newsletter', 'School', 'Web', 'Partners/Events', 'Media', 'Other']

  serialize :heard_through, Hash 
end

## Serialized data
# Notices represent the exceptions sent in from other applications
class Notice < ActiveRecord::Base 
  serialize :request, Hash
  serialize :session, Hash 
  serialize :environment, Hash 
  serialize :backtrace, Array
end