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
  end

  def peek
    @store[0]
  end

  def push(val)
  end

  public
  def self.child_indices(len, parent_index)
    indicies = []
    idx_1 = (parent_index * 2) + 1
    idx_2 = (parent_index * 2) + 2
    indicies << idx_1 if idx_1 < len
    indicies << idx_2 if idx_2 < len
    indicies
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }

  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
