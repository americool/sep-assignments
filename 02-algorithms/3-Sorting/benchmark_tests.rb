require 'benchmark'
require_relative 'buckets'
require_relative 'bucketsort'
require_relative 'heapsort'
require_relative 'max_heap'
require_relative 'node'
require_relative 'quicksort'

array_for_testing = []

for x in 1..50 do
  array_for_testing << rand(100)
end

Benchmark.bm(25) do |x|
  x.report("quicksort") do
    quicksort(array_for_testing)
  end
  x.report("heapsort") do
    heapsort(array_for_testing)
  end
  x.report("bucketsort") do
    bucketsort(array_for_testing)
  end
end


# Looking at the attached files (I added the silly barchart as well) it's clear (and unsurprising that the heapsort is by far the slowest (as we noted before, my heap check value method is rather inefficent.) The bucket sort is almost twice as slow as the quicksort, but that's not suprising, since it's stil using the quicksort to sort the values within the buckets. 
