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
    
    node_to_delete = find(value)
    if node_to_delete && node_to_delete.has_no_children
      node_to_delete = node_to_delete.remove
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if !tree_node.right
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
  end

  def remove?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:
  def has_no_children(node)

  end
end
