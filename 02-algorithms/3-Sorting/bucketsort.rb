require_relative 'buckets'
require_relative 'quicksort'

def bucketsort(array)
  array_o_buckets = []
  number_of_buckets = Math.sqrt(array.length).floor
  max_size = array.max

  count = 0

  #makes buckets
  until count > max_size
    new_bucket = Bucket.new(count, count + 4)
    array_o_buckets << new_bucket
    count +=5
  end

  #puts stuff in correct bucket
  array.each do |item|
    array_o_buckets.each do |bucket|
      if item >= bucket.min && item <= bucket.max
        bucket.data << item
      end
    end
  end

  # sorts data in remaining buckets and puts them into new array
  new_array = []
  array_o_buckets.each do |bucket|
    sorted_bucket = quicksort(bucket.data)
    new_array.concat(sorted_bucket)
  end
  new_array
end

# t_array = [9, 7, 5, 11, 12, 2, 14, 3, 10, 6]
# sort = bucketsort(t_array)
#
# puts sort
