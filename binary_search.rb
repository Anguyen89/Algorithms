def bsearch(arr, target)
  test_index = arr.size/2
  case
  when arr.empty?
    nil
  when target == arr[test_index]
    test_index
  when target > arr[test_index]
    a = bsearch(arr.drop(test_index + 1), target)
    a ? (test_index + 1 + a) : a
  else
    bsearch(arr.take(test_index), target)
  end
end

if __FILE__ == $PROGRAM_NAME
p  bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
end
