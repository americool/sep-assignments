# This method takes n arrays as input and combine them in sorted ascending  order
require_relative 'node'
require_relative 'linked_list'

def space_improved_poorly_written_ruby(*arrays)
  list = LinkedList.new()
  arrays.each do |array|
    array.each do |value|
      list.insert(value)
    end
    array = nil # this is a good idea?
  end
  sorted_array = []
  until list.head.nil?
    smallest_number = list.find_smallest_and_delete()
    sorted_array << smallest_number
  end
  sorted_array
end


# array1 = []
# array2 = []
# array3 = []
#
# 10.times do |x|
#   array1 << rand(100)
#   array2 << rand(100)
#   array3 << rand(100)
# end
# x = space_improved_poorly_written_ruby(array1, array2, array3)
# puts x
