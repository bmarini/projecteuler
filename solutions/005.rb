$:.unshift( File.expand_path( File.dirname(__FILE__) ) )
require 'euler_helpers'

# 2520 is the smallest number that can be divided by each of the numbers from 1
# to 10 without any remainder.
# 
# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?

primes = Enumerator.new do |yielder|
  prime = Proc.new { |n| 2.upto( Math.sqrt(n).ceil ).all? { |p| !n.multiple?(p) } }

  yielder.yield(2)

  n = 3
  loop do
    yielder.yield(n) if prime.call(n)
    n += 1
  end
end

nums    = (1..20).to_a
factors = []

primes.take_while do |prime|
  while nums.any? { |n| n.multiple?(prime) }
    nums.map! { |n| n.multiple?(prime) ? n / prime : n }
    factors.push(prime)
  end

  # keep taking until all numbers in set are reduced to 1
  nums.any? { |n| n > 1 }
end

p factors.reduce(:*)
