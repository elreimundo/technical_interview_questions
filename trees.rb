Node = Struct.new(:value, :left, :right)

Tree = Struct.new(:root) do
  def find(value)
  	find_node(root,value)
  end

  def insert(value)
  	self.root = insert_node(root,value)
  end

  private
  def find_node(node,value)
  	return node if !node || value == node.value
  	value < node.value ? find_node(node.left) : find_node(node.right)
  end

  def insert_node(node,value)
  	return Node.new(value,nil,nil) unless node
  	if value < node.value
  	  node.left = insert_node(node.left,value)
  	else
  		node.right = insert_node(node.right,value)
  	end
  	node
  end
end

tree = Tree.new(Node.new(8,nil,nil))
puts tree.root
puts tree.find(8) == Node.new(8,nil,nil)
tree.insert(9)
puts "Root has value #{tree.root.value}, left #{tree.root.left.inspect}, and right #{tree.root.right.inspect}"
