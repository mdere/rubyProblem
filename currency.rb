class Currency
  @currency_hash_mappings = {
    us_coins: {
      quarters: 25,
      dimes: 10,
      nickels: 5,
      pennies: 1
    }
  }
  def initialize()
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
  def self.set_new_currency_map(mapping_name, mapping)
    begin
      if mapping_name_is_valid(mapping_name) && mapping_is_valid(mapping)

      end
    rescue

    end
  end

  def self.get_available_currency_map_names()

  end

  def self.get_currency_map_info(map_name)

  end

  def self.change_for(value)

  end

  private
  def sanitize(value)
    # We will need to check if the string is
    # intended as an numerical
    # Ignore floats for now
    if value.is_a?(String)
      return value.is_a_number? ? value.to_i : nil
    end 
    # Check if Interger already OR float
    # Just floor the Float for now
    if value.is_a?(Integer) || value.is_a?(Float)
      return value.floor
    end
    return nil
  end

  def mapping_name_is_valid(mapping_name)

  end

  def mapping_is_valid(mapping_value)

  end

end