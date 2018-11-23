class TreeNode
    attr_accessor :val, :left, :right

    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

class Tree
	attr_reader :root, :paths, :path

	def initialize(val)
		@root = TreeNode.new(val)
		@paths = []
		@path = ""
	end

	def insert(node, val)
		if node == nil
			return
		end

		if node.val < val
			if node.right == nil
				node.right = TreeNode.new(val)
			else
				insert(node.right, val)
			end
		else
			if node.left == nil
				node.left = TreeNode.new(val)
			else
				insert(node.left, val)
			end
		end
	end

	def binary_tree_paths(root)
		return if root == nil

		@path += root.val.to_s
		if root.left == nil and root.right == nil
			@paths.push(path)
			@path = @root.val.to_s
		end
		@path += "->"
		current = root
		binary_tree_paths(current.left)
		binary_tree_paths(current.right)
	end
end

values = [5, 15, 14, 3, 7, 8, 17, 21]
tree = Tree.new(10)
values.each { |val| tree.insert(tree.root, val) }

tree.binary_tree_paths(tree.root)
p tree.paths