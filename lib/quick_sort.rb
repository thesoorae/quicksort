class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    mid = array.length/2
    pivot = array[mid]
    left = QuickSort.sort1(array[0...mid])
    right = QuickSort.sort1(array[mid+1..-1])
    return left + pivot + right 
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new(){|a,b| a <=> b}
    return array if length <= 1
    i = QuickSort.partition(array, start, length, &prc)
    QuickSort.sort2!(array, start, i - start, &prc)
    QuickSort.sort2!(array, i+1, length - i + start - 1, &prc)
    array
  end


  def self.partition(array, start, length, &prc)
    prc ||= Proc.new(){|a,b| a <=> b}
    pivot = array[start]
    barrier = start + 1
    (start + 1..start + length - 1).each do |i|

      if prc.call(array[i], pivot) == -1
        temp = array[barrier]
        array[barrier] = array[i]
        array[i] = temp
        barrier +=1
      end
  end
  temp2 = array[barrier - 1]
  array[barrier-1] = array[start]
  array[start] = temp2
  return (barrier - 1)
end
end
