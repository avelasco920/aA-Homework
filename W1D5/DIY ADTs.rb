class Stack
  attr_accessor :arr

  def initialize
    @arr = Array.new
  end

  def add(el)
    arr << el unless arr.include?(el)
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
  attr_accessor :arr

  def initialize
    @arr = Array.new
  end

  def assign(key, value)
    remove(key) if term_exist?(key)
    arr << [key, value]
  end

  def term_exist?(term)
    arr.each { |set| return true if set[0] == term }
  end

  def remove(key)
    arr.each do |el|
      arr.delete(el) if el[0] == key
    end
  end

  def show
    arr
  end
end
