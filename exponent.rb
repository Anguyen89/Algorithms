def exp(base, power)
  return 1 if power == 0
  base * exp(base, power - 1)
end

def exp2(base, power)
  return 1 if power == 0
  return base if power == 1
  if power % 2 == 0
    exp2(base, power/2) * exp2(base, power/2)
  else
    base * exp2(base, power/2) * exp2(base, power/2)
  end
end
