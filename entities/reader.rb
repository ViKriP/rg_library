# frozen_string_literal: true

# This class describes the entity of type a reader.
class Reader
  include Conf

  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, sity, street, house)
    @name = ex_s(name, 'name')
    @email = ex_s(email, 'email')
    @city = ex_s(sity, 'city')
    @street = ex_s(street, 'street')
    @house = ex_i(house, 'house')
  end

  def ==(other)
    name == other.name
  end
end
