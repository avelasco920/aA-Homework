class Stack
  attr_accessor :arr

  def initialize
    @arr = Array.new
  end

  def add(el)
    arr << el
  end

  def remove
    arr.pop
  end

  def show
    arr
  end
end


class Queue
  attr_accessor :arr

  def initialize
    @arr = Array.new
  end

  def enqueue(el)
    arr.unshift(el)
  end

  def dequeue
    arr.pop
  end

  def add(el)
    arr.unshift(el)
  end

  def remove
    arr.pop
  end

  def show
    arr
  end
end



class Map
  attr_accessor :hash

  def initialize
    @hash = Hash.new(nil)
  end

  def add(term, definition)
    hash[term] = definition
  end

  def remove(term)
    hash.delete(term)
  end

  def delete(term)
    hash.delete(term)
  end

  def show
    hash
  end
end
