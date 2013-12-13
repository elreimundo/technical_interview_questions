require 'benchmark'

# This method is optimized in *space*; that is, it requires almost no
# additional memory allocation beyond the original array

def pivot_index(array)
  total = array.inject(:+)
  running_count = 0
  array.each_index do |index|
    if running_count + array[index] + running_count == total
      return index
    else
      running_count += array[index]
    end
  end
  -1
end

# Run this code with the benchmarks at the bottom to verify that
# the above method, in addition to being more efficient in *space*,
# is also more efficient in *time* than the following:

def pivot_index_with_hashes_this_time(array)
  running_counts = Hash.new
  running_count = 0
  array.each_index do |index|
    running_counts[running_count + array[index] + running_count] = index
    running_count += array[index]
  end
  running_counts[running_count] || -1
end


# -----------BENCHMARKS-----------------------
def rand_arry(size)
 Array.new(size){rand(size)}
end

SIZE = 10000

Benchmark.bm(10) do |benchmark|
  benchmark.report("no hashes:") { 1000.times { pivot_index(rand_arry(SIZE)) } }
  benchmark.report("hashes:") { 1000.times { pivot_index_with_hashes_this_time(rand_arry(SIZE)) } }
end