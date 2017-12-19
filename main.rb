require_relative('./currency.rb')

# This is my test bed script
$currency = Currency.new

def create_currency_mapping(currency_name, mapping)
  begin
    $currency.create_currency_mapping(currency_name, mapping)
    puts "Created #{currency_name}"
  rescue => e
    puts "Falied to create: #{e.message}"
  end
end

def set_mapping_for(currency_name)
  begin
    $currency.set_mapping_for(currency_name)
    puts "mapping sucessfully set"
  rescue => e
    puts "Failed to set: #{e.message}"
  end
end

def get_available_currency_map_names()
  puts "existing currencies: #{$currency.get_available_currency_map_names()}"
end

def get_currency_mapping_for(map_name)
  $currency.get_currency_mapping_for(map_name)
end

def get_current_currency_mapping()
  puts "Current selected currency mapping: #{$currency.get_current_currency_mapping()}"
end

def get_current_currency_map_name()
  puts "Current selected currency name: #{$currency.get_current_currency_map_name()}"
end

def change_for(value)
  begin
    puts "Get change for #{value} <#{value.class}>: #{$currency.change_for(value)}"
  rescue => e
    puts "cant get change: #{e.message}"
  end
end

# Let's test the initial us_coin
get_available_currency_map_names()
get_current_currency_map_name()
get_current_currency_mapping()
change_for(1337)
change_for('1337')
change_for(1337.0) #Expect to fail
change_for('1337.0') #Expect to fail
change_for('L33T') #Expect to fail

puts "############################################"
puts "### Add and set new Currency new_us_coins###"
puts "############################################"
create_currency_mapping(:new_us_coins, {
  mapping: {
    nickel: 5,
    penny: 1,
    dollar_coin: 100,
    three_quarter_dollar: 75,
    half_dollar: 50,
    quarter: 25,
    dime: 10
  }
})
get_available_currency_map_names()
get_current_currency_map_name()
get_current_currency_mapping()
set_mapping_for(:new_us_coins)
get_current_currency_map_name()
get_current_currency_mapping()
change_for(1337)
change_for('1337')
change_for(1337.0) #Expect to fail
change_for('1337.0') #Expect to fail
change_for('L33T') #Expect to fail

puts "############################################"
puts "####### Add and set new Currency jpo #######"
puts "############################################"
create_currency_mapping(:jpn, {
  mapping: {
    "500 Yen" => 500,
    "100 Yen" => 100,
    "50 Yen" => 50,
    "10 Yen" => 10,
    "5 Yen" => 5,
    "1 Yen" => 1
  }
})
get_available_currency_map_names()
get_current_currency_map_name()
get_current_currency_mapping()
set_mapping_for(:jpn)
get_current_currency_map_name()
get_current_currency_mapping()
change_for(1337)
change_for('1337')
change_for(1337.0) #Expect to fail
change_for('1337.0') #Expect to fail
change_for('L33T') #Expect to fail
