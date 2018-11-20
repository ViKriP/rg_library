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
    @authors = load_yml(AUTHORS_DB)
    @readers = load_yml(READERS_DB)
    @books = load_yml(BOOKS_DB)
    @orders = load_yml(ORDERS_DB)
  end

  def save
    save_yml(AUTHORS_DB, @authors)
    save_yml(READERS_DB, @readers)
    save_yml(BOOKS_DB, @books)
    save_yml(ORDERS_DB, @orders)
  end

  def add_entity(entities_input:, arr:)
    found = nil
    arr.each { |entities| found = entities if entities == entities_input }
    found || arr.push(entities_input) && entities_input
  end

  def add_author(author_input)
    validate_type(author_input, Author)
    add_entity(entities_input: author_input, arr: @authors)
  end

  def add_reader(reader_input)
    validate_type(reader_input, Reader)
    add_entity(entities_input: reader_input, arr: @readers)
  end

  def add_book(book_input)
    validate_type(book_input, Book)
    add_entity(entities_input: book_input, arr: @books)
  end

  def add_order(order_input)
    validate_type(order_input, Order)
    add_entity(entities_input: order_input, arr: @orders)
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

  private

  def load_yml(path)
    File.exist?(path) ? YAML.load_file(path) : []
  end

  def save_yml(path, arr)
    File.open(path, 'w') { |file| file.write(arr.to_yaml) }
  end
end
