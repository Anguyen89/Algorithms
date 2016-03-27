def childs_retirement(your_age)
  child_age = childs_age(your_age)
  account_estimate(child_age) * years_until_retirement(child_age)
end

#helpers
def years_until_retirement(age)
  65 - age
end

def childs_age(your_age)
  your_age / 2
end

def account_estimate(age)
  age**2
end

if __FILE__ == $PROGRAM_NAME
  p childs_retirement(30)
  p childs_retirement(50)
end
