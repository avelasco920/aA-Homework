class LRUCache
  def initialize(limit)
    @cache = []
    @limit = limit
  end

  def count
    # returns number of elements currently in cache
    @cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if does_not_include?(el) && cant_take_more
      @cache.shift
    elsif does_include?(el) && cant_take_more
      @cache.delete(el)
    end
      @cache << el
  end

  def show
    # shows the items in the cache, with the LRU item first
    @cache
  end

  private
  # helper methods go here!
  def cant_take_more
    return true if @cache.length == 4
  end

  def does_not_include?(el)
    return true unless @cache.include?(el)
  end

  def does_include?(el)
    return true if @cache.include?(el)
  end

end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

p johnny_cache.show
