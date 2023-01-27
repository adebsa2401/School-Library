class Nameable
  def correct_name
    raise NotImplementedError, "You must implement #{self.class}##{__method__}"
  end
end
