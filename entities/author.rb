require File.expand_path("../../", __FILE__)+'/conf/conf'

class Author
  include Conf

  attr_reader :name, :biography
  
  def initialize(name, biography = '')
    @name = ex_s(name,"name")
    @biography = biography

  end
end
