
puts "I am a String object".methods
puts "======================================================="
puts "++++++++++++++++Methds sorted++++++++++++++++++++++++="
puts "======================================================="
puts "I am a String object".methods.sort
puts String.instance_methods(false).sort
puts "======================================================="
puts "++++++++++++++++Methds accessor++++++++++++++++++++++++="
puts "======================================================="
onj = Object.new
puts obj.private_methods 
puts obj.public_methods 
puts obj.protected_methods 
puts obj.singleton_methods