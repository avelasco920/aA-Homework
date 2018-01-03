# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store
  attr_reader :max

  def initialize
    @max = RingBuffer.new
    @store = RingBuffer.new
  end

  def enqueue(val)
    @store.unshift(val)
    if @max.length == 0
      @max.unshift(val)
    else
      temp_max = RingBuffer.new
      buffer = RingBuffer.new
      buffer.push(val)
      (@max.length).times do |i|
        if ((buffer.length > 0 && @max.length > 0) && buffer[0] > @max[0])
          temp_max.push(buffer.shift)
        end
        temp_max.push(@max.shift)
      end
      @max = temp_max
    end
    @store
  end

  def dequeue
    @max.pop
    @store.pop
  end

  def max
    return @store[0] if @store.length == 1
    @max[0]
  end

  def length
    @store.length
  end
end
