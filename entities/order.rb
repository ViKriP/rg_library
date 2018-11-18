# frozen_string_literal: true

class Order
  include Validation

  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Time.now)
    validate(book, reader)
    @book = book
    @reader = reader
    @date = date
  end

  def validate(book, reader)
    validate_type(book, Book)
    validate_type(reader, Reader)
  end
end
