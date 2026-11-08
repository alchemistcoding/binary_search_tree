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

end


