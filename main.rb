# require_relative('./currency.rb')
require('money')
# currency = Currency.new

# currency.create_currency_mapping(:new_us_coins, {
#   mapping: {
#     nickel: 5,
#     penny: 1,
#     dollar_coin: 100,
#     three_quarter_dollar: 75,
#     half_dollar: 50,
#     quarter: 'a',
#     dime: 10
#   },
#   denomination: 100
# })
# currency.set_mapping_for(:new_us_coins)
# puts "get currency data for '657': #{currency.change_for('657')}"
# puts "get currency data for 'a': #{currency.change_for('a')}"


money = Money.new(1000, 'USD')
puts money