# binary_search_tree

To make a binary search tree
```ruby
test_tree = Tree.new([1,2,3,4,5])
```

## The BST has the following methods

### #include?(value)
return true if value includes else false
```ruby
test_tree = Tree.new([1,2,3,4,5])

test_tree.include?(2) #return true
test_tree.include?(10) #return false
```

### #insert(value)
insert a value to the tree
```ruby
test_tree = Tree.new([1,2,3])
test_tree.insert(4)
```

### #delete(value)
delete a value from the tree
```ruby
test_tree = Tree.new([1,2,3])
test_tree.delete(3)
```
### #level_order
traversal the tree in breadth-first level order and yield each value to the provided block
```ruby
test_tree = Tree.new([1,2,3,4,5])
test_tree.level_order {|num| puts num.data}
```
### #preorder,#inorder,#postorder
traversal the tree in depth-first order and yield each value to the provided block
```ruby
test_tree = Tree.new([1,2,3,4,5])

arr_preorder = []
test_tree.preorder {|n| arr_preorder.push(n.data)} 

arr_inorder = []
test_tree.inorder {|n| arr_inorder.push(n.data)}

arr_postorder = []
test_tree.postorder {|n| arr_postorder.push(n.data)}

p arr_preorder #[3,1,2,5,4]
p arr_inorder #[1,2,3,4,5]
p arr_postorder #[2,1,4,5,3]
```
### #height(value)
return the height of the value
```ruby
test_tree = Tree.new([1,2,3,4,5])
test_tree.height(3) #return 2
test_tree.height(2) #return 0 
```
### #depth(value)
return the depth of the value.
```ruby
test_tree = Tree.new([1,2,3,4,5])
test_tree.depth(3) #return 0
test_tree.depth(2) #return 2
```
### #balanced?
return true if the tree is balanced else false
```ruby
test_tree = Tree.new([1,2,3,4,5])
test_tree.balanced? #true
test_tree.insert(10)
test_tree.insert(20)
test_tree.insert(30)
test_tree.balanced? #false
```
### #rebalance
```ruby
test_tree = Tree.new([1,2,3,4,5])
test_tree.balanced? #true
test_tree.insert(10)
test_tree.insert(20)
test_tree.insert(30)
test_tree.balanced? #false

test_tree.rebalance
test_tree.balanced? #true
```

