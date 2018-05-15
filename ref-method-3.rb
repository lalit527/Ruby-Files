def change_string(str)
  str.replace("New String Content!")
end

s = "Original String content!"
change_string(s) # send's reference to original string

t = "I can't be changed!"
change_string(t.dup) # send's a clone of original string

r = "I will be freezed"
r.freeze
# change_string(r) # throws error
change_string(r.dup) # this will work