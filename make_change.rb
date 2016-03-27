def make_change(amount, coins)
  return [] if coins.empty? || amount == 0 || coins.all? {|coin| coin > amount}

  coins.sort {|a,b| b <=> a}
  biggest_coin = coins.shift
  max_big_coin = amount / biggest_coin

  optimal_result = "You cannot make change for this amount with these coins".split('')
  (0..max_big_coin).each do |num_big_coin|
    results = []
    num_big_coin.times {results << biggest_coin}
    lesser_amount = amount - num_big_coin * biggest_coin
    results += make_change(lesser_amount, coins)
    if results.length < optimal_result.length && results.inject(:+) == amount
      optimal_result = results
    end
  end
  
  optimal_result
end

if __FILE__ == $PROGRAM_NAME
  p make_change(96, [25, 10, 5, 1])
  p make_change(7, [8 ,5])
  p make_change(14, [10, 7, 1])
end
