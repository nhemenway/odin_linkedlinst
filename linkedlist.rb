class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def value
    @value
  end
end

class LinkedList
  attr_accessor :name
  def initialize
    @head = nil
    @tail = nil
  end

  def to_s
    return "empty" if @head.nil? 
    node = @head
    loop do
      print node.value
      break if node == @tail
      print ' -> '
      node = node.next_node
    end
  end
  
  def start_list(value)
    @head = Node.new(value)
    @tail = @head
  end

  def append(value)
    if @head.nil?
      start_list(value) 
    else
      node = Node.new(value)
      @tail.next_node = node
      @tail = node
    end
  end

  def prepend(value)
    if @head.nil?
      start_list(value)
    else
      @head = Node.new(value, @head)
    end
  end

  def size
    node = @head
    size = 0
    until node.nil?
      size += 1
      node = node.next_node
    end
    size
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index)
    return "empty list" if @head.nil?
    node = @head
    (0...index).each do
      return "error" if node.next_node.nil?
      node = node.next_node
    end
    node.value
  end

  def pop
    return "empty list" if @head.nil?
    node = @head
    node = node.next_node until node.next_node == @tail
    @tail = node
    @tail.next_node = nil
  end

  def contains?(value)
    node = @head
    until node.nil?
      return true if node.value == value
      node = node.next_node
    end
    false
  end

  def find(value)
    node = @head
    i = 0
    until node.nil?
      return i if node.value == value
      node = node.next_node
      i += 1
    end
    false
  end

  def insert_at(index, value)
    return "empty list" if @head.nil?
    node = @head
    (0...index - 1).each do
      return "error" if node.next_node.nil?
      node = node.next_node
    end
    new_node = Node.new(value, node.next_node)
    node.next_node = new_node
  end

  def remove_at(index)
    return "empty list" if @head.nil?
    node = @head
    (0...index - 1).each do
      return "error" if node.next_node.nil?
      node = node.next_node
    end
    remove_node = node.next_node
    node.next_node.value = nil
    if remove_node == @tail
      @tail = node
      node.next_node = nil
    else
      remove_node.value = nil
      node.next_node = node.next_node.next_node
    end
  end

end



# l = LinkedList.new
# p l.at(0)
# p l.size
# l.append("A")
# l.append("b")
# l.append("c")
# l.prepend("z")
# l.prepend("y")
# l.inspect
# p l.size
# p l.head
# p l.tail
# p l.at(3)
# l.inspect
# p l.size
# l.pop
# l.inspect
# p l.size
# p l.contains?("w")
# p l.contains?("y")
# p l.find("A")
# p l.at(l.find("A"))
# l.to_s
# puts
# l.insert_at(2, "new")
# l.to_s
# l.remove_at(2)
# puts
# l.to_s
# puts
