$:.unshift( File.expand_path( File.dirname(__FILE__) ) )
require 'euler_helpers'

# The sum of the squares of the first ten natural numbers is,
#
#     12 + 22 + ... + 102 = 385
#
# The square of the sum of the first ten natural numbers is,
#
#     (1 + 2 + ... + 10)2 = 552 = 3025
#
# Hence the difference between the sum of the squares of the first ten natural
# numbers and the square of the sum is 3025 385 = 2640.
#
# Find the difference between the sum of the squares of the first one hundred
# natural numbers and the square of the sum.

def f(num)
  (1.upto(num).inject { |m,n| m + n**2 } - 1.upto(num).sum ** 2).abs
end

p f(10)
p f(100)