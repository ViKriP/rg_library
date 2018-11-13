# frozen_string_literal: true

# This class describes the entity of type a order.
class Order
  include Validation

  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Time.now)
    @book = validate_class(book, Book)
    @reader = validate_class(reader, Reader)
    @date = validate_date(date, 'date')
  end
end
