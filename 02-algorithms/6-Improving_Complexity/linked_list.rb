require_relative 'node'
class LinkedList
  attr_accessor :head

  def initialize()
    @head = nil
  end

  def insert(data)
    new_node = Node.new(data)
    if @head.nil?
      @head = new_node
    else
      target = findlast()
      target.next = new_node
    end
  end

  def findlast()
    moving_node = @head
    until moving_node.next.nil?
      moving_node = moving_node.next
    end
    moving_node
  end

  def find_smallest_and_delete()
    if @head.next.nil?
      smallest = @head.data
      @head = nil
      return smallest
    end

    moving_node = @head
    smallest = @head.data
    until moving_node.next.nil?
      if smallest >= moving_node.next.data
        smallest = moving_node.next.data
        previous = moving_node
      end
      moving_node = moving_node.next
    end

    if !previous.nil?
      temp = previous.next.next
      previous.next.next = nil
      previous.next = temp
    else
      temp = @head.next
      @head.next = nil
      @head = temp #this was screwed up forever until I discovered it said "heap" 
    end
    smallest
  end

end
