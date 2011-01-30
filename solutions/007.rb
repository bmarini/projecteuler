require_relative 'euler_helpers'

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.
# 
# What is the 10001st prime number?

primes = Enumerator.new do |yielder|
  prime = Proc.new { |n| 2.upto( Math.sqrt(n).ceil ).all? { |p| !n.multiple?(p) } }

  yielder.yield(2)

  n = 3
  loop do
    yielder.yield(n) if prime.call(n)
    n += 1
  end
end

p primes.take(10001).last