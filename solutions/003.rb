require_relative 'euler_helpers'

# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?

class Primes

  def self.prime_factors_reversed(num)

    Enumerator.new do |yielder|
      primes = new
      n = Math.sqrt(num).ceil

      loop do
        break if n <= 1

        if primes.prime?(n)
          yielder.yield(n) if num.multiple?(n)
        end

        n -= 1
      end
    end
  end

  def prime?(n)
    not has_a_prime_factor_other_than_one_and_itself?(n)
  end

  def has_a_prime_factor_other_than_one_and_itself?(n)
    square_root = Math.sqrt(n).ceil
    2.upto(square_root).any? { |p| n.multiple?(p) }
  end

end

p Primes.prime_factors_reversed(600851475143).first
