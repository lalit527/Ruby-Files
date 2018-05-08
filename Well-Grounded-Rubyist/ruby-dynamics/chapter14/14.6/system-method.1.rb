puts system("date")

puts $? # process id of thr process thatw e just ran

'''
The $? variable is thread loacl, if we call a program in one thread,
it\'s return value will affect only the $/ in that thread
'''

d = `date` # same as system("date")
puts d

"""
A call to a nonexistent method with backticks raises a fatal error:
"""
# d = `datee`

## Another way for syatem command
command = `date`
d = %x(#{command})

## Both the backticks and %x allow string interpolation: