**First, let's assume that we've defined our currency as follows:**
- Quarter: 25
- Dime: 10
- Nickel: 5
- Penny: 1

**Write a function that accepts a non-negative amount of money as input. This function should tell us a way to make change for that amount of money. Some examples:**
```
> change_for(25)
{quarters: 1}

> change_for(41)
{quarters: 1, dimes: 1, nickels: 1, pennies: 1}
```

**Your submission should demonstrated the following:**
- Input Validation
- Exception Handling
- Bonus points if the function is not dependent on a specific currency.
- Bonus points if you could solve using recursion.

We are looking for something that could potentially be used as a robust, production-quality solution. So, please take your time before submitting your solution. Be preapred to talk about your code during the next round of interviews.

## Instructions
### Main.rb

just run `ruby main.rb`

### Currency Class
#### Available Instance Methods:

**create_currency_mapping(:sumbol, hash_map)**

If you pass in a correct symbol name for the currency_name and correct hash_map, it will successfully create a new currency.

**Example of hash_map parameter:**
```
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
```
If any key is not a symbol or any value is not an integer, an exception will be raised.

**set_mapping_for(map_name)**

If you pass a symbol map_name it should set the correct mapping if the map_name exists

**get_available_currency_map_names()**

This will return an array of map_names

**get_currency_mapping_for(map_name)**

This will return an existing mapping for map_name if it exists

**get_current_currency_mapping()**

This will return current selected mapping to be processed against

**get_current_currency_map_name()**

This will return current selected mapping name

**change_for_non_recursive(value)**

If you pass in an Integer value, it should return back a hash of information based on the mapping selected

**change_for(value)**

If you pass in an Integer value, it should return back a hash of information based on the mapping selected