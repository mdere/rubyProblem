require_relative('string.rb')

class Currency
  # Initialize 
  
  def initialize()
    @currency_mappings = {}
    @currency_mappings[:us_coins] = {
      mapping: {
        quarters: 25,
        dimes: 10,
        nickels: 5,
        pennies: 1  
      },
      denomination: 100
    }
    @selected_mapping = @currency_mappings[:us_coins]
    @selected_mapping_mem_store = {}
    create_mem_store()
  end

  # We will want to allow the users to be able to define
  # there own currency hash.
  # A currency hash should be able to be freely named with
  # a name of denomination and the value of the denomination
  # For example:
  # currency_hash = {
  #   new_quarter: 50,
  #   new_dime: 20,
  #   new_nickel: 10,
  #   new_penny: 5
  # }
  # This method should allow users to add mappings to a defined
  # list held in memory that takes in mapping_name <String>
  # mapping <Hash>
  def create_currency_mapping(mapping_name, mapping)
    if mapping_name_is_valid(mapping_name) && mapping_is_valid(mapping)
      @currency_mappings[mapping_name] = mapping
    else
      raise "Failed to create currency mapping, please check parameters and try again"
    end
  end

  def set_mapping_for(map_name)
    if mapping_exists(map_name)
      @selected_mapping = nil
      @selected_mapping = @currency_mappings[map_name]
      create_mem_store()
    else
      raise "#{map_name} does not exist"
    end
  end

  def get_available_currency_map_names()
    array_of_names = []
    @currency_mappings.each do | key, value |
      array_of_names.push(key)
    end
    return array_of_names
  end

  def get_currency_map_info(map_name)
    return @currency_mappings[map_name]
  end

  def get_current_currency_map_info()
    return @selected_mapping
  end

  def change_for(value)
    create_mem_store()
    sanitizedValue = sanitize(value)
    if sanitizedValue && sanitizedValue > 0
      process_currency_for(sanitizedValue)
      return @selected_mapping_mem_store[:currency_data]
    else
      raise "Cannot accept value #{value} of type #{value.class}"
    end
  end

  private
  def process_currency_for(value)
    @selected_mapping_mem_store[:map_order].each do |mapping|
      @selected_mapping_mem_store[:currency_data][mapping[0]] = value/mapping[1]
      value = value%mapping[1]
    end
  end

  def create_mem_store()
    # take @selected_mapping and build the mem_store
    # start with currency_data
    @selected_mapping_mem_store = {
      currency_data: {},
      map_order: nil
    }
    map_order = []
    @selected_mapping[:mapping].each do |key, value|
      @selected_mapping_mem_store[:currency_data][key] = 0
      map_order.push([key, value])
    end
    # This will ensure that during processing will process the
    # largest denomination first, so that process currency for
    # could have smaller logic
    map_order.sort!{|x,y| y[1] <=> x[1]}
    @selected_mapping_mem_store[:map_order] = map_order
  end

  def sanitize(value)
    # We will need to check if the string is
    # intended as an numerical
    # Ignore floats for now
    if value.is_a?(String) && value.is_a_number?

    end
    # Check if Interger already OR float
    # Just floor the Float for now
    return value.is_a?(Integer) ? value
    return nil
  end

  def mapping_exists(mapping_name)
    return @currency_mappings[mapping_name] &&
           !@currency_mappings[mapping_name].empty?
  end

  # for now I will only accept symbols
  def mapping_name_is_valid(mapping_name)
    mapping_name.class == Symbol
  end

  # Check if there are valid key and value
  def mapping_is_valid(mapping)
    # lets make sure mapping and keys exist first
    if mapping && mapping.keys.length > 0
      # Lets checks if keys are valid
      mapping.each do |key, value|
        if !(key && key.class == Symbol)
          if (key == :mapping)
            mapping[key].each do |coin_name, coin_value|
              return false if !(coin_name &&
                              coin_name.class == Symbol &&
                              coin_value &&
                              coin_value > 0)
            end
          end
          if (key == :denomination)
            mapping[key] > 0 
          end
        end
      end
    end
    return true
  end

end