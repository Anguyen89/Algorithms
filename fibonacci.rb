def iter_fib(n)
  ret_arr = []
  (1..n).each do |x|
    if x < 3
      ret_arr << 1
    else
      ret_arr << (ret_arr[x - 2] + ret_arr[x - 3])
    end
  end
  ret_arr
end

def recurse_fib(n)
  return [1] if n == 0
  return [1,1] if n == 1
  previous_case = recurse_fib(n - 1)
  previous_case << previous_case[-1] + previous_case[-2]
end

if __FILE__ == $PROGRAM_NAME
  p recurse_fib(20)
end
