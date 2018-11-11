class Author
  include Conf

  attr_reader :name, :biography

  def initialize(name, biography = '')
    @name = ex_s(name, 'name')
    @biography = biography
  end

  def ==(other)
    name == other.name
  end
end
