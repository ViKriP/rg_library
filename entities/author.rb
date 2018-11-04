require File.expand_path("../../", __FILE__)+'/conf/ex'

class Author
  include Ex

  attr_reader :name, :biography
  
  def initialize(name, biography = '')
    @name = ex_s(name,"name")
    @biography = biography

  end
end
