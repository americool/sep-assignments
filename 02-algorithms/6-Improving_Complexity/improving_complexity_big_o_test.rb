require 'benchmark'
require_relative 'poorly_written_code'
require_relative 'improving_complexity_version_one(code_optimizations)'
require_relative 'improving_complexity_version_two(time_complexity)'
require_relative 'improving_complexity_version_three(space_complexity)'

array1 = []
array2 = []
array3 = []

1000.times do |x|
  array1 << rand(10000)
  array2 << rand(10000)
  array3 << rand(10000)
end

# 10000.times do |x|
#   array1 << rand(100000)
#   array2 << rand(100000)
#   array3 << rand(100000)
# end

Benchmark.bm(25) do |x|
  x.report("basic") do
    poorly_written_ruby(array1, array2, array3)
  end
  x.report("code optimizations") do
    code_improved_poorly_written_ruby(array1, array2, array3)
  end
  x.report("time optimizations") do
    complexity_improved_poorly_written_ruby(array1, array2, array3)
  end
  x.report("space optimizations") do
    space_improved_poorly_written_ruby(array1, array2, array3)
  end
end


# Original & code optimizations are O(n^2)
# Time optimizations O(n) but technically really O(n)
# Space optimizations O(2^n)
