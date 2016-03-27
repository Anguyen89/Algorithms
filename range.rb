def range(start, end_num)
  return [] if end_num < start
  [start] + range(start + 1, end_num)
end
