class Regexp
    alias __old_match__ match
    def match(string)
        __old_match__(string) || []
    end
end

regexp = /abc/
string = "X"
puts /abc/.match("X")[1]

## If the match fails the program will return [] instead of nil
# The below will not work at any place
if regexp.match(string)  
    # something 
else 
    # something 
end