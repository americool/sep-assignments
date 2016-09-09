require_relative 'buckets'

def bucketsort(array)
  array_o_buckets = []
  number_of_buckets = Math.sqrt(array.length).floor
  count = 1
  until count > number_of_buckets
    Bucket.new()
    array_o_buckets <<

end
