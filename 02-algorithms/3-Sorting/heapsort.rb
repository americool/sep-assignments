require_relative 'node'
require_relative 'max_heap'

def heapsort(array)
  heap = MaxHeap.new()
  new_array = []
  array.each do |x|
    heap.insert(x)
    heap.print()
    puts "-----"
  end
  heap.check_values([heap.root])
  # heap.print()
  # puts "-----"
  until new_array.length == array.length
    new_array << heap.root.data
    heap.delete(heap.root.data)
    # heap.print()
    # puts "-------"
  end

  new_array
end


# inserts data into max heap
# swaps root (largest) into last value
# removes last value and inserts it into new array
# resorts heap

test_array = [3,2,4,7,6,5,8,9,10,1]

answer = heapsort(test_array)

puts answer
