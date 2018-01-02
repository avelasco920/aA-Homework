# This class just dumbs down a regular Array to be statically sized.
class StaticArray
  def initialize(length)
    Array.new(length)
  end

  # O(1)
  def [](index)
    self.at(index)
  end

  # O(1)
  def []=(index, value)
    self[index] = value
  end

  protected
  attr_accessor :store
end
