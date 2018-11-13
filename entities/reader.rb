# frozen_string_literal: true

# This class describes the entity of type a reader.
class Reader
  include Validation

  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, sity, street, house)
    @name = validate_string(name, 'name')
    @email = validate_string(email, 'email')
    @city = validate_string(sity, 'city')
    @street = validate_string(street, 'street')
    @house = validate_integer(house, 'house')
  end

  def ==(other)
    name == other.name
  end
end
