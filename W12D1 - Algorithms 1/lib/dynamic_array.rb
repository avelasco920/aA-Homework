require_relative "static_array"
require "byebug"

class DynamicArray
  attr_reader :length

  def initialize
    @capacity = 8
    @length = 0
    @store = StaticArray.new(@length)
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if index + 1 > @length
    @store[index]
  end

  # O(1)
  def []=(index, value)
    @store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" unless @store[0]
    @store[@length - 1] = nil
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length == @capacity
    @store[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" unless @store[0]
    new_store = StaticArray.new(@length - 1)
    last = @store[0]
    (1..@length - 1).each do |idx|
      new_store[idx - 1] = @store[idx]
    end
    @length -= 1
    @store = new_store
    last
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @length == @capacity
    new_store = StaticArray.new(@length + 1)
    @length += 1
    new_store[0] = val
    (0..@length).each do |i|
      new_store[i + 1] = @store[i]
    end
    @store = new_store
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_store = StaticArray.new(@capacity * 2)
    (0..@capacity).each do |idx|
      new_store[idx] = @store[idx]
    end
    @capacity *= 2
    @store = new_store
  end
end
