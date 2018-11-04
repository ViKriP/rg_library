module Ex
  def ex_s(var, val = "")
    raise "#{self.class} #{val} not valid" unless var.is_a?(String) && !var.empty?
    return var
  end

  def ex_i(var, val = "")
    raise "#{self.class} #{val} not valid" unless var.is_a?(Integer) && !var > 0
    return var
  end

  def ex_cl(var, val)
    raise "#{self.class} #{val} not valid" unless var.instance_of?(val)
    return var
  end

  def ex_dt(var, val)
    raise "#{self.class} #{val} not valid" unless var.instance_of?(Time)
    return var
  end
end
