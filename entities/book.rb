class Book
  include Conf

  attr_reader :title, :author

  def initialize(title, author)
    @title = ex_s(title, 'title')
    @author = ex_cl(author, Author)
  end

  def ==(other)
    title == other.title
  end
end
