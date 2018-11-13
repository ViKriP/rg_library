# frozen_string_literal: true

# This module is intended for validation and advanced settings.
module Validation
  def validate_string(var, val = '')
    raise "#{self.class} #{val} not valid" unless var.is_a?(String) && !var.empty?

    var
  end

  def validate_integer(var, val = '')
    raise "#{self.class} #{val} not valid" unless var.is_a?(Integer) && var.positive?

    var
  end

  def validate_class(var, val)
    raise "#{self.class} #{val} not valid" unless var.instance_of?(val)

    var
  end

  def validate_date(var, val)
    raise "#{self.class} #{val} not valid" unless var.instance_of?(Time)

    var
  end
end
