class Array

  def merge_sort
    return self unless self.nil? || self.size > 1
    split = self.size/2
    left_side = self.take(split).merge_sort
    right_side = self.drop(split).merge_sort
    merge(left_side, right_side)
  end

  def merge (left_side, right_side)
    ret_arr = []
    until left_side.empty? || right_side.empty?
      if left_side.first > right_side.first
        ret_arr << right_side.shift
      else
        ret_arr << left_side.shift
      end
    end
    if left_side.empty?
      until right_side.empty?
        ret_arr << right_side.shift
      end
    else
      until left_side.empty?
        ret_arr << left_side.shift
      end
    end
    ret_arr
  end
end

if __FILE__ == $PROGRAM_NAME
  p (0..102).to_a.shuffle.merge_sort
end
