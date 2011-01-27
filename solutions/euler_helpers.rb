class Integer
  def multiple?(other)
    self % other == 0
  end
end

module Enumerable
  def sum
    inject { |sum, el| sum + el }
  end
end