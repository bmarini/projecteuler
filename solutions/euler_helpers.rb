class Integer
  def multiple?(other)
    self % other == 0
  end
end

module Enumerable
  def sum
    reduce(:+)
  end
end