def quicksort(array, p, r)
  if p < r
    q = partion(array, p, r)
    quicksort(array, p, q-1)
    quicksort(array, q+1, r)
  end
end

def partion(array, p, r)
  q = p
  j = q
  while j < r
    if array[j] <= array[r]
      swap(array, j, q)
      q+=1
    end
    j+=1
  end
  swap(array, r, q)
  return q
end

def swap(array, firstIndex, secondIndex)
  temp = array[firstIndex]
  array[firstIndex] = array[secondIndex]
  array[secondIndex] = temp
end

test_array = [9, 7, 5, 11, 12, 2, 14, 3, 10, 6]

swapped_array = quicksort(test_array, 0, (test_array.length - 1))

puts swapped_array
