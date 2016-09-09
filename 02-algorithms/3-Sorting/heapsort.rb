require_relative 'node'
require_relative 'max_heap'

def heapsort(array)
  heap = MaxHeap.new()
  new_array = []
  array.each do |x|
    heap.insert(x)
  end

  until new_array.length == array.length
    last_parent = heap.find_parent_of_last(@root)
    if !last_parent.right.nil?
      temp = heap.head
      heap.head = last_parent.right
      last_parent.right = nil
    else
      temp = heap.head
      heap.head = last_parent.left
      last_parent.left = nil
    end
    new_array << temp.data
    heap.check_values
  end
end


# inserts data into max heap
# swaps head (largest) into last value
# removes last value and inserts it into new array
# resorts heap

test_array = [3,2,4,7,6,5,8,9,10,1]

answer = heapsort(test_array)

puts answer
