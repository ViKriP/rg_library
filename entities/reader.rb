require File.expand_path("../../", __FILE__)+'/conf/ex'

class Reader
  include Ex

  attr_reader :name, :email, :sity, :street, :house
  
  def initialize(name, email, sity, street, house)
    @name = ex_s(name, "name")
    @email = ex_s(email, "email")
    @sity = ex_s(sity, "sity")
    @street = ex_s(street, "street")
    @house = ex_i(house)

  end
end
