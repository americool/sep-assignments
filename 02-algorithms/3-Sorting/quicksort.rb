def quicksort(array)
  return array if array.length < 2
  pivot = array.length - 1
  big_array = []
  small_array = []
  final_array = []
  for x in 0...pivot
    if array[x] >= array[pivot]
      big_array << array[x]
    else
      small_array << array[x]
    end
  end
  if small_array.length > 0
    final_array.concat(quicksort(small_array))
  end
    final_array << array[pivot]
  if big_array.length > 0
    final_array.concat(quicksort(big_array))
  end
  final_array
end


# test_array = [9, 7, 5, 11, 12, 2, 14, 3, 10, 6]
# sorted_array = quicksort(test_array)
# puts sorted_array
