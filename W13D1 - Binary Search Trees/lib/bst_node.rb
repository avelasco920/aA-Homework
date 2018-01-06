class BSTNode
  attr_reader :value
  attr_accessor :right, :left, :parent

  def initialize(value)
    @value = value
    @right
    @left
    @parent
  end

  def left=(child_node)
    child_node.parent = self
    @left = child_node
  end

  def right=(child_node)
    child_node.parent = self
    @right = child_node
  end
end
