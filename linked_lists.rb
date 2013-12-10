Node = Struct.new(:value, :next)

List = Struct.new(:head) do
	def each
		node = head
		while node
			yield node
			node = node.next
		end
	end

	def find(value)
		each {|node| return node if node.value == value}
		nil
	end

	def find_all(value)
		nodes = []
		each {|node| nodes.push(node) if node.value == value}
		nodes
	end

	def unshift(value)
		self.head = Node.new(value,self.head)
	end

	def push(value)
		last.next = Node.new(value,nil)
	end

	def last
		each{|node| return node if node.next == nil}
	end
end

# a("First") -> b("Second") -> b("Third")
c = Node.new("Third",nil)
b = Node.new("Second",c)
a = Node.new("First",b)
list = List.new(a)

list.each {|fish|	puts fish.value}
puts "Find First: #{list.find("First").inspect}"
puts "Find Fourth: #{list.find("Fourth").inspect}"
list.push("Fourth")
puts "Find Fourth: #{list.find("Fourth").inspect}"
list.unshift("A")
puts "List's head is now: #{list.head.value}"