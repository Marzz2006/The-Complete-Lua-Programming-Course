-- A binary tree is a data structure in which each node can have a left child and a right child.
-- They cannot have more than two children.

-- Common uses of a binary trees are binary search trees, binary heaps and Huffman coding.

-- Define a node structure for the binary tree_damage

local Node = {}

Node.__index = Node

function Node.new(value)
    local self = setmetatable({},Node)
    self.value = value
    self.left = nil
    self.right = nil
    return self
end

local root = Node.new(10)
root.left = Node.new(5)
root.right = Node.new(15)
root.left.left = Node.new(3)
root.left.right = Node.new(7)
root.right.left = Node.new(12)
root.right.right = Node.new(20)

print("Value of root node: ",root.value)
print("Value of root node left: ",root.left.value)