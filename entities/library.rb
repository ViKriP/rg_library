# frozen_string_literal: true

# This class allows you to perform library statistics.
class Library
  include Validation

  attr_accessor :authors, :readers, :books, :orders, :readers_top_books

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

  def top_reader(quantity = 1)
    top_readers = {}

    @orders.each do |ord|
      top_readers[ord.reader] = if top_readers.key?(ord.reader)
                                  top_readers[ord.reader] + 1
                                else
                                  top_readers[ord.reader] = 1
                                end
    end

    top_readers.sort_by { |a| -a[1] }[0...validate_integer(quantity)]
  end

  def most_popular_books(quantity = 1)
    top_books = {}

    @orders.each do |ord|
      top_books[ord.book] = if top_books.key?(ord.book)
                              top_books[ord.book] + 1
                            else
                              top_books[ord.book] = 1
                            end
    end

    top_books.sort_by { |a| -a[1] }[0...validate_integer(quantity)]
  end

  def number_of_readers_of_the_most_popular_books(quantity = 3)
    a = most_popular_books(quantity)

    @readers_top_books = []

    @orders.each do |ord|
      (0...validate_integer(quantity)).each do |i|
        @readers_top_books.push(ord.reader) if ord.book == a[i][0]
      end
    end

    number_of_readers = @readers_top_books
    number_of_readers.uniq.size
  end

  def entities_add(entities_input:, path_db:, arr:)
    found = nil
    arr.each { |entities_i| found = entities_i if entities_i == entities_input }
    found || arr.push(entities_input) && File.open(path_db, 'w') { |file| file.write(arr.to_yaml) } && entities_input
  end

  def entities_del(entities_out, path_db, entities_arr)
    File.open(path_db, 'w') { |file| file.write(entities_arr.to_yaml) } unless
(entities_arr.reject! { |author_i| author_i == entities_out }).nil?
  end

  def author_name(name)
    found = nil
    @authors.each { |author_i| found = author_i if author_i.name == name }
    found
  end

  def author_add(author_input)
    validate_class(author_input, Author)
    entities_add(entities_input: author_input, path_db: AUTHORS_DB, arr: @authors)
  end

  def author_del(author_out)
    validate_class(author_out, Author)
    entities_del(author_out, AUTHORS_DB, @authors)
  end

  def reader_name(name)
    found = nil
    @readers.each { |reader_i| found = reader_i if reader_i.name == name }
    found
  end

  def reader_add(reader_input)
    validate_class(reader_input, Reader)
    entities_add(entities_input: reader_input, path_db: READERS_DB, arr: @readers)
  end

  def reader_del(reader_out)
    validate_class(reader_out, Reader)
    entities_del(reader_out, READERS_DB, @readers)
  end

  def book_title(title)
    found = nil
    @books.each { |book_i| found = book_i if book_i.title == title }
    found
  end

  def book_add(book_input)
    validate_class(book_input, Book)
    entities_add(entities_input: book_input, path_db: BOOKS_DB, arr: @books)
  end

  def book_del(book_out)
    validate_class(book_out, Book)
    entities_del(reader_out, BOOKS_DB, @books)
  end

  def order_save(order)
    validate_class(order, Order)
    @orders.push(order)
    File.open(ORDERS_DB, 'w') { |file| file.write(@orders.to_yaml) }
    order
  end

  def order_db_clear
    @orders.clear
    File.open(ORDERS_DB, 'w') { |file| file.write(@orders.to_yaml) }
  end

  def top_readers_stats(top_readers)
    a1 = top_reader(top_readers)
    out = "\n\r==========\n\rTop readers\n\r\n\r"
    (0...validate_integer(top_readers)).each { |i| out += "Reader name - #{a1[i][0].name} | count book - #{a1[i][1]}\n\r" }
    out
  end

  def most_popular_books_stats(top_books)
    a2 = most_popular_books(top_books)
    out = "----------\n\rMost popular books\n\r\n\r"
    (0...validate_integer(top_books)).each { |i| out += "Book title - #{a2[i][0].title} | number taken - #{a2[i][1]}\n\r" }
    out
  end

  def top_readers_books_stats(books_count)
    number_of_readers_of_the_most_popular_books(books_count)

    out = "----------\n\rStatistics readers of the most popular books\n\r\n\r"
    out += most_popular_books_stats(books_count)
    out += readers_stats
    out
  end

  def readers_stats
    out = "\n\rALL Readers top books - #{@readers_top_books.count}\n\r\n\r"

    arr = @readers_top_books.each { |r| out += "Reader - #{r.name}\n\r" }.uniq

    out += "\n\rUNIQ Readers top books - #{arr.count}\n\r\n\r"

    arr.each { |r| out += "Reader - #{r.name}\n\r" }

    out += "\n\rNumber of readers of the most popular books = #{arr.count}"
    out
  end
end
