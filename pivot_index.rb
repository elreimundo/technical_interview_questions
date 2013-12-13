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

puts pivot_index([1,3,2,7,5,1]) == 3
