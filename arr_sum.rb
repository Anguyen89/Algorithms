def iterative_sum(arr)
  arr.inject(:+)
end

def recursive_sum(arr)
  return nil if arr.empty?
  return arr[0] if arr.length == 1
  recursive_sum(arr[1..-1]) + arr[0]
end
