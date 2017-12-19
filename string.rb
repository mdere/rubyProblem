class String
  def is_an_integer?()
    # Check if value is Float, if true, reject it
    return false if /^\d*\.\d*$/.match(self)
    Integer(self) != nil rescue false
  end
end