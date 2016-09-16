require_relative '../3-Sorting/quicksort'
# This method takes n arrays as input and combine them in sorted ascending  order
def complexity_improved_poorly_written_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    array.each do |value|
      combined_array << value
    end
  end
  sorted_array = quicksort(combined_array)
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
#
# x = complexity_improved_poorly_written_ruby(array1, array2, array3)
# puts x
