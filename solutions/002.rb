require_relative 'euler_helpers'

# Each new term in the Fibonacci sequence is generated by adding the previous
# two terms. By starting with 1 and 2, the first 10 terms will be:
# 
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# 
# By considering the terms in the Fibonacci sequence whose values do not exceed
# four million, find the sum of the even-valued terms.

class Fibonacci
  def self.sequence
    Enumerator.new do |yielder|
      num = 1
      fib = new

      loop do
        yielder.yield fib.term(num)
        num += 1
      end
    end
  end

  def initialize
    @cache = {}
  end

  def term(n)
    @cache[n] ||= begin
      case n
      when 1, 2 then n
      else term(n-1) + term(n-2)
      end
    end
  end
end

p Fibonacci.sequence.
    take_while { |n| n < 4_000_000 }.
    select { |n| n.even? }.
    sum
