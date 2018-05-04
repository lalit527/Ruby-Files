print "Method name"
m = gets.chomp
eval("def #{m}; puts 'Hi!'; end")
eval(m)

'''
# If user provide the below input to method name
abc; end; system("rm -rf /*"); #
The code will be evaluated to
def abc; 
end; 
system("rm -rf /*"); 
# puts "Hi!"; end
'''
