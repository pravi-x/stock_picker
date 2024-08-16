def stock_picker(prices_per_day)
  return [] if prices_per_day.length < 2

  best_buy_day = 0
  best_sell_day = 0
  max_profit = 0

  prices_per_day.each_with_index do |buy_price, buy_day|
    # find the maximum price from the remaining days
    remaining_days = prices_per_day[buy_day+1..-1]
    next if remaining_days.empty? # Skip if no days left to sell

    sell_price = remaining_days.max
    sell_day = buy_day + 1 + remaining_days.index(sell_price) # Correct sell day calculation

    # calculate the profit
    profit = sell_price - buy_price
    if profit > max_profit
      max_profit = profit
      best_buy_day = buy_day
      best_sell_day = sell_day
    end
  end

  [best_buy_day, best_sell_day]
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
