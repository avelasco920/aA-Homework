require 'bst_node'

# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    new_node = BSTNode.new(value)
    if @root.nil?
      @root = new_node
    else
      @root.insert(new_node)
    end
  end

  def find(value, tree_node = @root)
    return nil if !tree_node
    return tree_node if tree_node.value == value
    if value >= tree_node.value
      return nil unless tree_node.right
      find(value, tree_node.right)
    elsif value < tree_node.value
      return nil unless tree_node.left
      find(value, tree_node.left)
    end
  end

  def delete(value)
    @root = nil if @root.value == value && @root.has_no_children
    node = find(value)
    if !node
      return nil
    elsif node.has_no_children
      node.replace_with(nil)
    elsif node.num_children == 1
      child_node = node.only_child
      @root = child_node if child_node.is_root
      node.replace_with(child_node)
    elsif node.num_children == 2
      max_node = maximum(node.left)
      child_node = max_node.only_child
      max_node.replace_with(child_node)
      @root = max_node if max_node.is_root
      node.replace_with(max_node)
    end
  end


  # helper method for #delete:

  def maximum(tree_node = @root)
    return tree_node if !tree_node.right
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return 0 if !tree_node
    return 0 if tree_node.has_no_children && tree_node.is_root
    return 1 if tree_node.has_no_children
    count = depth(tree_node.right) + 1 if tree_node.right
    count = depth(tree_node.left) + 1 if tree_node.left
    count
  end

  def remove?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:
end
