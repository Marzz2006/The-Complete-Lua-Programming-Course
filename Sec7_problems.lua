--Create Node system
local Node = {}
Node.__index = Node

function Node.new(value)
    local self = setmetatable({},Node)
    self.value = value
    self.left = nil
    self.right = nil
    return self
end

-- Create the example binary tree

local root = Node.new(1)
root.left = Node.new(7)
root.right = Node.new(9)
root.left.left = Node.new(2)
root.left.right = Node.new(6)
root.right.right = Node.new(9)
root.left.right.left = Node.new(5)
root.left.right.right = Node.new(11)
root.right.right.left = Node.new(5)
-- root.left.right.right.right = Node.new(88)

local root2 = Node.new(1)
root2.left = Node.new(7)
root2.right = Node.new(9)
root2.left.left = Node.new(2)
root2.left.right = Node.new(6)
root2.right.right = Node.new(9)
root2.left.right.left = Node.new(5)
root2.left.right.right = Node.new(11)
root2.right.right.left = Node.new(5)

local root3 = Node.new(1)
root3.left = Node.new(2)
root3.left.left = Node.new(4)
root3.left.right = Node.new(5)
root3.left.right.left = Node.new(7)
root3.left.right.right = Node.new(8)
root3.right = Node.new(3)
root3.right.left = Node.new(6)
-- root3.right.right = (9)

local root4 = Node.new(1)
root4.left = Node.new(3)
root4.left.right = Node.new(6)
root4.right = Node.new(2)
root4.right.left = Node.new(4)
root4.right.right = Node.new(5)
root4.right.right.left = Node.new(8)
root4.right.right.right = Node.new(7)

local root5 = Node.new(1)
root5.left = Node.new(2)
root5.left.left = Node.new(4)
root5.left.right = Node.new(5)
root5.right = Node.new(3)
root5.right.left = Node.new(6)
root5.right.right = Node.new(7)

local root6 = Node.new(10)
root6.left = Node.new(5)
root6.left.left = Node.new(3)
root6.left.right = Node.new(7)
root6.right = Node.new(15)
root6.right.left = Node.new(12)
root6.right.right = Node.new(20)

local root7 = Node.new(1)
root7.left = Node.new(2)
root7.left.left = Node.new(4)
root7.left.right = Node.new(5)
root7.right = Node.new(3)
root7.right.left = Node.new(6)
root7.right.right = Node.new(7)

local root8 = Node.new(40)
root8.left = Node.new(4)
root8.left.right = Node.new(34)
root8.left.right.left = Node.new(14)
root8.left.right.left.left = Node.new(13)
root8.left.right.left.right = Node.new(15)
root8.right = Node.new(45)
root8.right.right = Node.new(55)
root8.right.right.left = Node.new(48)
root8.right.right.left.left = Node.new(47)
root8.right.right.left.right = Node.new(49)
--root8.right.right.left.right = Node.new(2)

local root9 = Node.new(5)
root9.left = Node.new(4)
root9.left.left = Node.new(11)
root9.left.left.left = Node.new(7)
root9.left.left.right = Node.new(2)
root9.right = Node.new(8)
root9.right.left = Node.new(13)
root9.right.right = Node.new(4)
root9.right.right.right = Node.new(1)


-- Problem 1
-- Write a function called size that, given a tree, returns it's size, that is, the number of nodes it contains.

-- Output: 9

-- Define a node structure for the binary tree

function size(node)
    if not node then
        return 0
    else
        return 1 + size(node.left) + size(node.right)
    end
end
print("Problem 1:")
print("Size of the binary tree: ", size(root))
print()

-- Problem 2
-- Write a function called eight to compute the height of a given binary tree

function height(node)
    if not node then
        return -1
    else
        local leftheight = height(node.left)
        local rightheight = height(node.right)

        return 1 + math.max(leftheight,rightheight)
    end
end


print("Problem 2:")
print("Height of the binary tree: ", height(root))
print()

-- Problem 3
-- Write a boolean function called equal that, given two binary trees, tells whether they are the same.

function equal(tree1, tree2)
    if not tree1 and not tree2 then
        return true
    elseif tree1 and tree2 then        
        if tree1 and tree2 then
            return tree1.value == tree2.value and equal(tree1.left,tree2.left) and equal(tree1.right,tree2.right)
        end
    else
        return false
    end
end

print("Problem 3")
print("Are binary tree's equal: ",equal(root,root2))
print()

-- Problem 4
-- Write a boolean function called isomorphic that, given two trees, tells whether they are isomorphic, that is, 
-- if one can obtain one from the other flipping some of it's descendants.

function isomorphic(tree3,tree4)
    if not tree3 and not tree4 then
        return true
    elseif tree3 and tree4 then
        local case1 = isomorphic(tree3.left,tree4.left) and isomorphic(tree3.right,tree4.right)
        local case2 = isomorphic(tree3.left,tree4.right) and isomorphic(tree3.right,tree4.left)

        return case1 or case2 
    else
        return false
    end
end

print("Problem 4")
print("Are binary tree's isomorphic: ",isomorphic(root3,root4))
print()

-- Problem 5
-- Write a function called pre-order that, given a binary tree, returns its pre-order traversal.
-- expected result: 1,2,4,5,3,6,7

function preorder(node,result)
    result = result or {}
    if node then
        table.insert(result,node.value)
        preorder(node.left,result)
        preorder(node.right,result)
    end

    return result
end

print("Problem 5")
-- print("this the the PreOrder of the tree: ",preorder(root5)) -- This did not print out the text
print("This is the PreOrder of the tree: ", table.concat(preorder(root5), ", "))
print()

-- Problem 6
-- Write a function called postorder that, given a binary tree, returns its postorder traversal.
-- expected result: 3, 7, 5, 12, 20, 15, 10

function postorder(node,result)
    result = result or {}
    if node then
        postorder(node.left,result)
        postorder(node.right,result)
        table.insert(result,node.value)
    end
    return result
end

print("Problem 6")
print("This is the PostOrder of the tree: ", table.concat(postorder(root6), ", "))
print()

-- Problem 7
-- Write a function called inorder that, given a binary tree, returns its in order traversal.
-- Expected result: 4, 2, 5, 1, 6, 3, 7

function inorder(node,result)
    result = result or {}

    if node then
        inorder(node.left,result)
        table.insert(result,node.value)
        inorder(node.right,result)
    end
    return result
end



print("Problem 7")
print("This is the In Order traversal of the tree: ", table.concat(inorder(root7), ", "))
print()

-- Problem 8
-- Write a function called minimum that, given a binary tree, returns the minimum value on the nodes.
-- expected output: 4

-- My attempt that failed

--if node then
--    local min = node.value or 0
--    local min_v = min_value or 0
--    if min > min_v then
--        min = min_v
--    end
--   if minimum(node.left, min) < min then
--        min = minimum(node.left)
--    elseif minimum(node.right, min) < min then
--        min = minimum(node.right)
--    end
--    return min
--end


function minimum(node,min_value)
    if not node then
        return nil
    else
        local minLeft = minimum(node.left)
        local minRight = minimum(node.right)

        local currentMin = node.value

        if minLeft and minLeft < currentMin then
            currentMin = minLeft
        end
        if minRight and minRight < currentMin then
            currentMin = minRight
        end

        return currentMin
    end
end

print("Problem 8")
print("This is the Minimum of the tree: ", minimum(root8))
print()

-- Problem 9
-- We'll define a root to leaf path to be a sequence of nodes in a tree starting with the root node and proceeding 
-- downward to a leaf(a node with no children). We'll say that anb empty tree contains no root to leaf paths.
-- expected output:
-- path 1: 5 4 11 7
-- path 2: 5 4 11 2
-- path 3: 5 8 13
-- path 4: 5 8 4 1