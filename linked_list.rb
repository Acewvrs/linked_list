class LinkedList 
   attr_reader :head
   attr_reader :tail
   attr_reader :size
   
  def initialize(size = 0) 
    @head = nil
    @tail = nil
    @size = size
    if @size > 0
      @head = Node.new(0, nil)

      current_node = @head
      for i in 1..(@size - 1)
        tmp = Node.new(i, nil)
        current_node.next_node = tmp
        current_node = tmp
      end
      @tail = current_node
    end
  end

  def append(value) 
    new_node = Node.new(value, nil)
    tmp = @head
    while tmp.next_node != nil
      tmp = tmp.next_node
      
    end
    tmp.next_node = new_node
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    @size += 1
    @head = new_node
  end

  def at(index)
    if index > @size - 1
      return nil
    end

    tmp = @head
    for i in 0..(index - 1)
      tmp = tmp.next_node
    end
    return tmp
  end

  def pop
    if @size == 1
      @head = nil
      @tail = nil
    else
      tmp = @head
      for i in 0..(@size - 2)
      tmp = tmp.next_node
      end
      tmp.next_node = nil
    end
    @size -= 1
  end
  
  def contains?(value)
    if (@head.value == value) 
      return true
    end

    tmp = @head
    for i in 0..(@size - 1)
      tmp = tmp.next_node
      if tmp.value == value 
        return true
      end
    end

    return false
  end

  def find(value)
    if (@head.value == value) 
      return 0
    end

    tmp = @head
    for i in 1..(@size)
      tmp = tmp.next_node
      if tmp.value == value 
        return i
      end
    end

    return nil
  end
  
  def to_s()
    if @size > 0
      tmp = @head
      for i in 1..@size
        print " ( #{tmp.value} ) -> "
        tmp = tmp.next_node
      end
    end
    print " nil \n"
  end

  def print_list()
    tmp = @head
    for i in 1..@size
      puts tmp.value
      tmp = tmp.next_node
    end
    puts "---------------"
  end
end

class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value = nil, next_node = nil)
    @next_node = next_node
    @value = value
  end
end

# initializes list ---------------------------------------------
size = 5
linked = LinkedList.new(size)
# tmp = linked.head
# for i in 1..size
#   puts tmp.value
#   tmp = tmp.next_node
# end
linked.print_list()

# append
linked.append(5)
linked.print_list()

# 
linked.prepend(-1)
linked.print_list()

#
puts "size of the linked list is: #{linked.size()}"

puts "the head value: #{linked.head.value}"

idx = 0
idx2 = 4
puts "the node at index #{idx} has the value #{linked.at(idx).value}"
puts "the node at index #{idx2} has the value #{linked.at(idx2).value}"

linked.pop
linked.print_list()

puts linked.contains?(4)
puts linked.contains?(-1)
puts linked.contains?(-3)

value = -1
puts "the node at index #{linked.find(value)} contains #{value}"
value2 = 3
puts "the node at index #{linked.find(value2)} contains #{value2}"

puts "linked list in string form: "
linked.to_s()