require File.expand_path("../../", __FILE__)+'/conf/ex'

class Book
  include Ex

  attr_reader :title, :author
  
  def initialize(title, author)
    @title = ex_s(title, "title")
    @author = ex_cl(author, Author)

  end
end
