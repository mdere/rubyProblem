require_relative('currency.rb')

currency = Currency.new

puts "current available mappings: #{currency.get_available_currency_map_names()}" 

puts "Get currency data for 55: #{currency.change_for(55)}"

currency.create_currency_mapping(:new_us_coins, {
  nickel: 5,
  penny: 1,
  dollar_coin: 100,
  three_quarter_dollar: 75,
  half_dollar: 50,
  quarter: 25,
  dime: 10
})

puts "current available mappings: #{currency.get_available_currency_map_names()}"
puts "get currency map info for new currency: #{currency.get_currency_map_info(:new_us_coins)}"
currency.set_mapping_for(:new_us_coins)
puts "get current currency mapping: #{currency.get_current_currency_map_info()}"
puts "get currency data for 697: #{currency.change_for(697)}"