class String
  def is_a_number?
    Float(self) != nil rescue false
  end
end

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


def change_for(value)
  sanitizedValue = sanitize(value)
  if sanitizedValue && sanitizedValue > 0
    # Init hash mem store
    mem_store = {
      quarters: 0,
      dimes: 0,
      nickels: 0,
      pennies: 0
    }
    # quarters block
    if sanitizedValue >= 25
      mem_store[:quarters] = sanitizedValue/25
      sanitizedValue = sanitizedValue%25
    end
    # dimes block
    if sanitizedValue < 25 && sanitizedValue >= 10
      mem_store[:dimes] = sanitizedValue/10
      sanitizedValue = sanitizedValue%10
    end
    # nickels block
    if sanitizedValue < 10 && sanitizedValue >= 5
      mem_store[:nickels] = sanitizedValue/5
      sanitizedValue = sanitizedValue%5
    end
    # pennies block
    if sanitizedValue < 5 && sanitizedValue >= 1
      mem_store[:pennies] = sanitizedValue/1
      sanitizedValue = sanitizedValue%1
    end
  end
  puts mem_store
  return mem_store
end

change_for(9999)
