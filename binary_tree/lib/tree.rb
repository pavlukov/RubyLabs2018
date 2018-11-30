require_relative './tree_node.rb'

class Tree
  attr_reader :root, :paths, :path

  def initialize(val = 0)
    raise ArgumentError if val.class != Integer

    @root = TreeNode.new(val)
    @paths = []
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

  def find_paths(node, path = '')
    return if node.nil? || node.class != TreeNode

    path += node.val.to_s
    @paths.push(path) if last_node?(node)
    path += '->'

    find_paths(node.left, path)
    find_paths(node.right, path)
  end

  private

  def last_node?(node)
    node.left.nil? && node.right.nil?
  end

end

values = [5, 15, 14, 3, 7]
tree = Tree.new(10)
values.each { |val| tree.insert(tree.root, val) }
tree.find_paths(tree.root)
p tree.paths
