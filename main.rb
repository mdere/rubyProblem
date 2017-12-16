require_relative('currency.rb')

currency = Currency.new

current_mapping = currency.get_available_currency_map_names()

puts "current available mappings: #{current_mapping}" 

puts currency.change_for(55)