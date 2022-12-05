
class Node
  attr_accessor :value, :next_node
  
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_reader :head, :tail

  def initialize
    @head
    @tail
  end

  def prepend(value)
    if @head == nil
      @head = Node.new(value, nil)
      @tail = @head
    else
      @head = Node.new(value, @head)
    end
  end

  def append(value)
    if @head == nil
      prepend(value)
    else
      temp = @head
      temp = temp.next_node until temp.next_node == nil
      @tail = Node.new(value)
      temp.next_node = @tail
    end
  end

  def size
    return 0 if @head == nil && @tail == nil
    count = 0
    temp = @head
    until temp.next_node == nil
      count += 1
      temp = temp.next_node
      count += 1 if temp.next_node == nil
    end
    count
  end

  def head
    "Head value = #{@head.value}"
  end

  def tail
    "Tail value = #{@tail.value}"
  end

  def at(index)
    return "No data found" if index + 1 > self.size || index < 0
    count = 0
    temp = @head
    return temp.value if index == 0
    until count == index
      count += 1
      temp = temp.next_node
    end
    temp.value
  end

  def pop
    return "List is empty" if @head == nil
    temp = @head
    temp = temp.next_node until temp.next_node.next_node == nil
    @tail = temp
    temp.next_node = nil
  end

  def contain?(value)
    return false if @head == nil
    temp = @head
    contain = false
    until temp == nil      
      contain = true if temp.value == value
      temp = temp.next_node
    end
    contain
  end

  def find(value)
    return nil if @head == nil || contain?(value) == false
    temp = @head
    index = 0
    until temp == nil
      break if temp.value == value
      temp = temp.next_node
      index += 1
    end
    index
  end

  def to_s
    return "List is empty" if @head == nil
    temp = @head
    str = ""
    until temp == nil
      str.concat("( #{temp.value} ) -> ")
      temp = temp.next_node
    end
    str.concat("nil")
    str
  end

  def insert_at(value, index)
    self.append(value) if index > (self.size - 1) # append at tail if index too big
    curr = @head
    prev = nil
    index.times do 
      prev = curr
      curr = curr.next_node
    end
    curr = Node.new(value, curr)
    prev.next_node = curr
  end

  def remove_at(index)
    return puts "No data found at index #{index}" if index > (self.size - 1)
    curr = @head
    prev = nil
    index.times do
      prev = curr
      curr = curr.next_node
    end
    prev.next_node = curr.next_node
  end
end

# list = LinkedList.new
# list.prepend(16)
# list.prepend(17)
# list.prepend(77)
# list.append(20)
# list.append(707)
# list.append(202)
# list.append(2022)
# p list.size
# puts list
# list.insert_at(666, 4)
# puts list
# list.remove_at(3)
# puts list