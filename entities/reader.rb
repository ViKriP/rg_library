# frozen_string_literal: true

class Reader
  include Validation

  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, sity, street, house)
    validate(name, email, sity, street, house)
    @name = name
    @email = email
    @city = sity
    @street = street
    @house = house
  end

  def validate(name, email, sity, street, house)
    [name, email, sity, street].map do |el|
      validate_type(el, String)
      validate_empty(el)
    end
    validate_type(house, Integer)
  end

  def ==(other)
    name == other.name
  end
end
