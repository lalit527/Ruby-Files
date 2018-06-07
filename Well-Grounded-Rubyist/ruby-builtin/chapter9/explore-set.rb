"""
The file for set.rb, lib subdirectory
"""
# Set initialize

def initialize(enum = nil, &block)
  @hash ||= Hash.new
  enum.nil? and return

  if block
    enum.each { |o| add(block[0]) }
  else
    merge(enum)
  end
end

# include
def include?(o)
  @hash.include?(o)
end

#add and #set
def add?(o)
  if include?(o)
    nil
  else
    add(o)
  end
end