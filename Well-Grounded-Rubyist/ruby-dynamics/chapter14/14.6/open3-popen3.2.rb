require 'open3'
stdin, stdout, stderr = Open3.popen3("cat")

puts stdin.puts("Hi.\nBye")
puts stdout.gets

puts stdout.gets