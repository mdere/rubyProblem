class String
  def is_a_number?
    Float(self) != nil rescue false
  end
end