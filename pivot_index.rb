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

# This method is even faster than the previous method, so it is likely
# optimized in *time* (only one complete cycle plus a hash lookup is faster
# than the one-to-two passes above), but it requires O(N) space

def pivot_index_with_hashes_this_time(array)
  running_counts = Hash.new
  running_count = 0
  array.each_index do |index|
    running_counts[running_count + array[index] + running_count] = index
    running_count += array[index]
  end
  running_counts[running_count] || -1
end

puts pivot_index([1,3,2,7,5,1]) == 3
puts pivot_index_with_hashes_this_time([1,3,2,7,5,1]) == 3
puts pivot_index([1,3,2,7,5]) == -1
puts pivot_index_with_hashes_this_time([1,3,2,7,5]) == -1
