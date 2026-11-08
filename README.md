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