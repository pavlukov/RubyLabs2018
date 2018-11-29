require './lib/tree_node.rb'

class Tree
  attr_reader :root, :paths, :path

  def initialize(val = 0)
    raise ArgumentError if val.class != Integer

    @root = TreeNode.new(val)
    @paths = []
    @path = ''
  end

  def insert(node, val)
    return if node.nil?

    if node.val < val && node.right.nil?
      node.right = TreeNode.new(val)
    elsif node.val < val && !node.right.nil?
      insert(node.right, val)
    elsif node.val > val && node.left.nil?
      node.left = TreeNode.new(val)
    elsif node.val > val && !node.left.nil?
      insert(node.left, val)
    end
  end

  def get_paths(node)
    raise ArgumentError if node.class != TreeNode

    find_paths(node)
  end

  private

  def find_paths(node, path = '')
    return if node.nil?

    path += node.val.to_s
    if node.left.nil? && node.right.nil?
      @paths.push(path)
    end
    path += '->'
    current = node
    find_paths(current.left, path)
    find_paths(current.right, path)
  end
end

values = [5, 15, 14, 3, 7]
tree = Tree.new(10)
values.each { |val| tree.insert(tree.root, val) }
tree.get_paths(tree.root)
p tree.paths
