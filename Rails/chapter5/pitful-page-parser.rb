"""
Parsing html content of a page using regular expression
"""
require 'uri' 
require 'open-uri'
url = 'http://theurlofthewebpage.com'
html = open(url).read
if html =~ /class="status"><img 
  src="\/images\/.*\.png">(.*)<\/span/ 
  status = $1 
end

"""
Correct using Gem
"""
# Nokogiri Gem
require 'rubygems' 
require 'nokogiri' 
require 'open-uri' 
url = 'http://theurlofthewebpage.com' 
doc = Nokogiri::HTML(open(url)) 
status = doc.css('.status').first.content

"""
Restful call
"""
require 'rest_client' 
RestClient.get 'http://example.com/resource'
RestClient.post 'http://example.com/resource',
                :param1 => 'one', 
                :nested => { :param2 => 'two' }
RestClient.delete 'http://example.com/resource'