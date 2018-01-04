require_relative 'heap'

def k_largest_elements(array, k)
  res = BinaryMinHeap.new
  k.times do
    res.push(array.pop)
  end
  until array.empty?
    res.push(array.pop)
    res.extract
  end
  res.store
end
