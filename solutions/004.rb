# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

palindromes = Enumerator.new do |yielder|
  999.downto(1).each do |n|
    999.downto(1).each do |m|
      product = (n * m).to_s
      yielder.yield(product.to_i) if product == product.reverse
    end
  end
end

p palindromes.max