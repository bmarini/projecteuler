$:.unshift( File.expand_path( File.dirname(__FILE__) ) )
require 'euler_helpers'

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we
# get 3, 5, 6 and 9. The sum of these multiples is 23.
# 
# Find the sum of all the multiples of 3 or 5 below 1000.

# Method 1
p (1...1000).select { |n| n.multiple?(3) || n.multiple?(5) }.sum

# Method 2: Creating an infinite sequence
seq = Enumerator.new do |yielder|
  num = 1

  loop do
    yielder.yield(num) if num.multiple?(3) || num.multiple?(5)
    num += 1
  end
end

p seq.take_while { |n| n < 1000 }.sum
