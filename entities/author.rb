# frozen_string_literal: true

class Author
  include Validation

  attr_reader :name, :biography

  def initialize(name, biography = '')
    validate(name)
    @name = name
    @biography = biography
  end

  def validate(name)
    validate_type(name, String)
    validate_empty(name)
  end

  def ==(other)
    name == other.name
  end
end
