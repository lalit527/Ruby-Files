module M
	def talk
		puts "Hi from module!"	
	end
end

class C
	include M 
	def talk
		puts "Hi from original class!"	
	end
end


c = C.new 
c.talk

class << c 
	include M 
end 
c.talk

c = C.new 
class << c
	include M
	p ancestors 
end