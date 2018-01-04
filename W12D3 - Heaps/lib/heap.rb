class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc = prc
  end

  def count
    @store.length
  end

  def extract
    raise "no element to extract" if count == 0
    val = store[0]
    if count > 1
      store[0] = store.pop
      self.class.heapify_down(store, 0, &prc)
    else
      store.pop
    end
    val
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, count - 1, count, &@prc)
    val
  end

  public
  def self.child_indices(len, parent_index)
    indicies = []
    [1, 2].each do |n|
      idx = (parent_index * 2) + n
      indicies << idx if idx < len
    end
    indicies
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    children = self.child_indices(len, parent_idx)

    if children.all? { |child_idx| prc.call(array[parent_idx], array[child_idx]) <= 0 }
      return array
    elsif children.empty?
      return array
    elsif children.length == 1
      smallest_child_idx = children[0]
    else
      smallest_child_idx = prc.call(array[children[0]], array[children[1]]) <= 0 ? children[0] : children[1]
    end

    array[parent_idx], array[smallest_child_idx] = array[smallest_child_idx], array[parent_idx]
    self.heapify_down(array, smallest_child_idx, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx == 0
    prc ||= Proc.new { |a, b| a <=> b }
    parent_idx = self.parent_index(child_idx)
    if prc.call(array[parent_idx], array[child_idx]) == 1
      array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
      self.heapify_up(array, parent_idx, len, &prc)
    end
    array
  end
end
