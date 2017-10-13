# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"


def sluggish_oct(arr)
  arr.each_index do |i|
    (0...arr.length).each do |j|
      if arr[i].length < arr[j].length
        arr[i], arr[j] = arr[j], arr[i]
      end
    end
  end
  arr.last
end


def dominant_oct(arr)
  return arr if arr.length <= 1
  mid_idx = arr.length / 2
  left = arr[0...mid_idx]
  right = arr[mid_idx..-1]
  merge(dominant_oct(left), dominant_oct(right))
end

def merge(left, right)
  result = []
  until left.length == 0 || right.length == 0
    if left[0].length <= right[0].length
      result << left.shift
    else
      result << right.shift
    end
  end
  result + left + right
end


def clever_octopus(arr)
  longest_fish = arr.shift
  arr.each do |el|
    longest_fish = el if el.length > longest_fish.length
  end
  longest_fish
end

def slow_dance(pos, arr)
  arr.each_with_index do |el, i|
    return i if pos == el
  end
end


def fast_dance(dir, hash)
  hash.key(dir)
end

#
# dance_hash = {
#   1 => "up", 2 => "right-up", 3 => "right",
#   4 => "right-down", 5 => "down",
#   6 => "left-down", 7 => "left", 8 => "left-up"
# }
#
# p fast_dance("up", dance_hash)
