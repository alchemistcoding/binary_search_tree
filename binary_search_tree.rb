class Node
  attr_accessor :data, :left, :right
  def initialize(data, left, right)
    @data = data
    @left = left
    @right = right
  end
end

class Tree
  attr_reader :root
  def initialize(array)
    @root = build_tree(array.uniq.sort)
  end

  def build_tree(array, first = 0 , last = array.length)

    return nil if first > last
    mid = (first + last) / 2
    return nil if array[mid] == nil
    left = build_tree(array, first, mid - 1)
    right = build_tree(array, mid + 1, last)
    
    return Node.new(array[mid], left, right)
  end

  def include?(value)
    current = @root
    loop do
      return false if current.data == nil
      return true if current.data == value
      if current.data > value
        return false if current.left == nil
        current = current.left
      else 
        return false if current.right == nil
        current = current.right
      end
    end  
  end

  def insert(value)
    @root = insert_helper(@root, value)
  end

 def delete(value)
  @root = delete_helper(@root, value)
 end

 def level_order
  return to_enum(:level_order) unless block_given?
  queue = [@root]
  while queue.length > 0
    queue.push(queue[0].left) if queue[0].left
    queue.push(queue[0].right) if queue[0].right
    yield(queue.shift) 
  end
 end

 def preorder(root = @root, &block)
    return to_enum(:preorder) unless block_given?
    return if root == nil
    yield root
    preorder(root.left, &block)
    preorder(root.right, &block)
 end

 def inorder(root = @root, &block)
    return to_enum(:inorder) unless block_given?
    return if root == nil
    inorder(root.left, &block)
    yield root
    inorder(root.right, &block)
 end

 def postorder(root = @root, &block)
    return to_enum(:postorder) unless block_given?
    return if root == nil
    postorder(root.left, &block)
    postorder(root.right, &block)
    yield root
 end

 def height(value = @root.data)
    current = @root
    loop do
      return nil if current == nil
      if current.data > value
        current = current.left
      elsif current.data < value
        current = current.right
      else break
      end
    end

    height_helper(current)
 end

 def depth(value)
   current = @root
   count = 0
   loop do
     return nil if current == nil
     if current.data > value
       current = current.left
       count += 1
     elsif current.data < value
      current = current.right   
      count += 1
     else return count
     end
   end
 end

 def balanced?
  preorder do |node|
    return false if (height_helper(node.left) - height_helper(node.right)).abs > 1
  end
  true
 end

 def rebalance
   arr = []
   preorder do |node|
     arr.push(node.data)
   end
   @root = build_tree(arr.sort)
 end

 private
 def delete_helper(root, value)
  return nil if root == nil || root.data == nil

  if root.data == value
    if root.right == nil
      return root.left
    elsif root.left == nil
      return root.right
    else
      current = root.right
      while current != nil && current.left != nil
        current = current.left
      end
      root.data = current.data
      root.right = delete_helper(root.right, root.data)
    end
  elsif root.data > value
    root.left = delete_helper(root.left, value)
  else root.right = delete_helper(root.right, value)
  end
  return root
 end

 def insert_helper(root, value)
   return Node.new(value, nil, nil) if root == nil || root.data == nil
   return root if root.data === value
   if root.data > value
     root.left = insert_helper(root.left, value)
   else root.right = insert_helper(root.right, value)
   end
   root
 end

 def height_helper(root)
   return - 1 if root == nil
   return [height_helper(root.left), height_helper(root.right)].max + 1
 end

end




