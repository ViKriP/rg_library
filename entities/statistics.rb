# frozen_string_literal: true

module Statistics
  include Validation

  def top_reader_stats(orders, quantity)
    top(orders, quantity, :reader)
  end

  def most_popular_books_stats(orders, quantity)
    top(orders, quantity, :book)
  end

  def number_readers_top_books_stats(orders, quantity)
    top_books = most_popular_books_stats(orders, quantity)
    orders.select { |order| top_books.include? order.book }.map(&:reader).uniq.count
  end

  private

  def top(orders, quantity, symb)
    orders.group_by(&symb).sort_by { |_key, value| value.count }.reverse.first(quantity).to_h.keys
  end
end
