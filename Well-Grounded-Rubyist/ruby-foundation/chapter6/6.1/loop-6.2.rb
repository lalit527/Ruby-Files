"""
Unconditional looping
loop { puts "Looping forever!" } 
loop do 
  puts "Looping forever!"
end
"""

## Controlling the loop
n = 1 
loop do
  n = n + 1
  break if n > 9 
end

n = 1 
loop do
  n = n + 1
  next unless n == 10
  break 
end

"""
Looping based on array of values
"""
celsius = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100] 
puts "Celsius\tFahrenheit" 
for c in celsius
  puts "c\t#{Temperature.c2f(c)}" 
end