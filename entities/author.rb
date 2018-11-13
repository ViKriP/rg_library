# frozen_string_literal: true

# This class describes the entity of type a author.
class Author
  include Validation

  attr_reader :name, :biography

  def initialize(name, biography = '')
    @name = validate_string(name, 'name')
    @biography = biography
  end

  def ==(other)
    name == other.name
  end
end
