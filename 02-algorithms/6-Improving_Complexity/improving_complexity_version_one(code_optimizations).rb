# This method takes n arrays as input and combine them in sorted ascending  order
def code_improved_poorly_written_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    combined_array.concat(array) # this should replace the extra loop? Be faster (appears to be slightly)?
  end

  sorted_array = [combined_array.delete_at(combined_array.length-1)]

  for val in combined_array
    i = 0
    not_found = true
    while i < sorted_array.length-1  # added -1 to avoid extra check
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        not_found = false
        break
      end
      i+=1
    end
    if not_found
      sorted_array.push(val)
    end # faster because we don't need to check the value of i every time in the while
  end

  # Return the sorted array
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
#
# x = code_improved_poorly_written_ruby(array1, array2, array3)
# puts x
