class BSTNode
  attr_reader :value
  attr_accessor :right, :left, :parent

  def initialize(value)
    @value = value
    @right
    @left
    @parent
  end

  def replace_with(new_node)
    if @value > @parent.value
      @parent.right = new_node
    elsif @value <= @parent.value
      @parent.left = new_node
    end
  end

  def insert(node)
    if node.value > @value
      set_right(node)
    elsif node.value <= @value
      set_left(node)
    end
  end

  def set_right(node)
    if @right
      @right.insert(node)
    else
      @right = node
      node.parent = self
    end
  end

  def set_left(node)
    if @left
      @left.insert(node)
    else
      @left = node
      node.parent = self
    end
  end

  def has_no_children
    !self.right && !self.left
  end

  def num_children
    count = 0
    count += 1 if @right
    count += 1 if @left
    count
  end

  def only_child
    return @right if @right
    @left
  end

  def is_root
    !@parent
  end

  def children
    children = []
    children << @right if @right
    children << @left if @left
    children
  end


  # def left=(child_node)
  #   @left = child_node
  #   child_node.parent = self
  # end
  #
  # def right=(child_node)
  #   @right = child_node
  #   child_node.parent = self
  # end

end
