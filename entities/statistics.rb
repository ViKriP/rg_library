# frozen_string_literal: true

module Statistics
  include Validation

  def top_reader_stats(orders, quantity)
    orders.group_by(&:reader).sort_by { |_key, value| -value.count }.first(quantity).to_h.keys
  end

  def most_popular_books_stats(orders, quantity)
    orders.group_by(&:book).sort_by { |_key, value| -value.count }.first(quantity).to_h.keys
  end

  def number_readers_top_books_stats(orders, quantity)
    top_books = most_popular_books_stats(orders, quantity)
    orders.select { |order| top_books.include? order.book }.map(&:reader).uniq.count
  end
end
