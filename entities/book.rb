# frozen_string_literal: true

class Book
  include Validation

  attr_reader :title, :author

  def initialize(title, author)
    validate(title, author)
    @title = title
    @author = author
  end

  def validate(title, author)
    validate_type(title, String)
    validate_empty(title)
    validate_type(author, Author)
  end
end
