class BSTNode
  attr_reader :value
  attr_accessor :right, :left, :parent

  def initialize(value)
    @value = value
    @right
    @left
    @parent
  end

  def remove
    if @value > @parent.value
      @parent.right = nil
    elsif @value <= @parent.value
      @parent.left = nil
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
