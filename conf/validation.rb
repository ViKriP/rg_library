# frozen_string_literal: true

module Validation
  def validate_type(entity, type)
    raise TypeError unless entity.instance_of?(type)
  end

  def validate_empty(string)
    raise ArgumentError if string.empty?
  end
end
