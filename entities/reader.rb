require File.expand_path("../../", __FILE__)+'/conf/conf'

class Reader
  include Conf

  attr_reader :name, :email, :city, :street, :house
  
  def initialize(name, email, sity, street, house)
    @name = ex_s(name, "name")
    @email = ex_s(email, "email")
    @city = ex_s(sity, "city")
    @street = ex_s(street, "street")
    @house = ex_i(house, "house")

  end
end
