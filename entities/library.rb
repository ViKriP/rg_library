# frozen_string_literal: true

class Library
  include Validation
  include Statistics

  attr_accessor :authors, :readers, :books, :orders

  def initialize
    @authors = []
    @books = []
    @readers = []
    @orders = []

    load_datas
  end

  def load_datas
    @authors = YAML.load_file(AUTHORS_DB) if File.exist?(AUTHORS_DB)
    @readers = YAML.load_file(READERS_DB) if File.exist?(READERS_DB)
    @books = YAML.load_file(BOOKS_DB) if File.exist?(BOOKS_DB)
    @orders = YAML.load_file(ORDERS_DB) if File.exist?(ORDERS_DB)
  end

  def save
    File.open(AUTHORS_DB, 'w') { |file| file.write(@authors.to_yaml) }
    File.open(READERS_DB, 'w') { |file| file.write(@readers.to_yaml) }
    File.open(BOOKS_DB, 'w') { |file| file.write(@books.to_yaml) }
    File.open(ORDERS_DB, 'w') { |file| file.write(@orders.to_yaml) }
  end

  def entities_add(entities_input:, arr:)
    found = nil
    arr.each { |entities| found = entities if entities == entities_input }
    found || arr.push(entities_input) && entities_input
  end

  def author_add(author_input)
    validate_type(author_input, Author)
    entities_add(entities_input: author_input, arr: @authors)
  end

  def reader_add(reader_input)
    validate_type(reader_input, Reader)
    entities_add(entities_input: reader_input, arr: @readers)
  end

  def book_add(book_input)
    validate_type(book_input, Book)
    entities_add(entities_input: book_input, arr: @books)
  end

  def order_add(order_input)
    validate_type(order_input, Order)
    entities_add(entities_input: order_input, arr: @orders)
  end

  def order_db_clear
    File.open(ORDERS_DB, 'w') { |file| file.write(@orders.clear.to_yaml) }
  end

  def top_reader(quantity = 1)
    top_reader_stats(@orders, quantity)
  end

  def most_popular_books(quantity = 1)
    most_popular_books_stats(@orders, quantity)
  end

  def number_readers_top_books(quantity = 3)
    number_readers_top_books_stats(@orders, quantity)
  end
end
