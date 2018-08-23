require './recursive_counter.rb'

counter = RecursiveCounter.create_recursive_counter do |invoker, a, b|
  m = a < b ? a : b
  n = a < b ? b : a
  r = n % m
  r == 0 ? m : invoker.invoke(r, m)
end

# 15, 24 (1) / 9, 15 (2) / 6, 9 (3) / 3, 6 (4) => GCD 3, count 4
r = counter.invoke(15, 24)
puts "#{r}, #{counter.count}"