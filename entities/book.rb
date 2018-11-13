# frozen_string_literal: true

# This class describes the entity of type a book.
class Book
  include Validation

  attr_reader :title, :author

  def initialize(title, author)
    @title = validate_string(title, 'title')
    @author = validate_class(author, Author)
  end

  def ==(other)
    title == other.title
  end
end
