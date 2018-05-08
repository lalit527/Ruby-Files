puts system("date")

puts $? # process id of thr process thatw e just ran

'''
The $? variable is thread loacl, if we call a program in one thread,
it\'s return value will affect only the $/ in that thread
'''