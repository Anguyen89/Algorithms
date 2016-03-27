def deep_dup(arr)
  return arr unless arr.is_a?(Array)
  arr.map {|el| deep_dup(el)}
end
