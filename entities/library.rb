require 'yaml'
require File.expand_path("../../", __FILE__)+'/conf/conf'
require File.expand_path("..", __FILE__)+'/author'
require File.expand_path("..", __FILE__)+'/book'
require File.expand_path("..", __FILE__)+'/order'
require File.expand_path("..", __FILE__)+'/reader'

class Library
  include Conf

  attr_accessor :authors, :readers, :books, :orders

  def initialize
    @authors = []
    @books = []
    @readers = []
    @orders = []
    
    open()
  end

  def open
    @authors = YAML.load_file(AUTHORS_DB) if File.exist?(AUTHORS_DB)
    @readers = YAML.load_file(READERS_DB) if File.exist?(READERS_DB)
    @books = YAML.load_file(BOOKS_DB) if File.exist?(BOOKS_DB)
    @orders = YAML.load_file(ORDERS_DB) if File.exist?(ORDERS_DB)
  end

  def test
    puts authors
    puts readers
    puts books
    puts orders
  end

  def save

  end

  def top_reader

  end

  def most_popular_books

  end

  def number_of_readers_of_the_most_popular_books

  end

  def author(name)
    found = nil
    @authors.each { |author_i| found = author_i if author_i.name == name}
    return found
  end

  def author_add(name, biography = "")
    found = false

    @authors.each { |author_i| found = true if author_i.name == name}

    unless found
      author_new = Author.new(name, biography)
      @authors.push(author_new) unless found
      File.open(AUTHORS_DB, 'w') { |file| file.write(@authors.to_yaml) }
    end
    #open()
  end

  def author_del(name)
    if @authors.reject! { |author_i| author_i.name == name } != nil
      File.open(AUTHORS_DB, 'w') { |file| file.write(@authors.to_yaml) }
    end
  end

  def reader(name)
    found = nil
    @readers.each { |reader_i| found = reader_i if reader_i.name == name}
    return found
  end

  def reader_add(name, email, city, street, hous)
    found = false

    @readers.each { |reader_i| found = true if reader_i.name == name}

    unless found
      reader_new = Reader.new(name, email, city, street, hous)
      @readers.push(reader_new) unless found
      File.open(READERS_DB, 'w') { |file| file.write(@readers.to_yaml) }
    end
  end

  def reader_del(name)
    if @readers.reject! { |reader_i| reader_i.name == name } != nil
      File.open(READERS_DB, 'w') { |file| file.write(@readers.to_yaml) }
    end
  end

  def book(title)
    found = nil
    @books.each { |book_i| found = book_i if book_i.title == title}
    return found
  end

  def book_add(title, author)
    found = false

    @books.each { |book_i| found = true if book_i.title == title}

    unless found
      @books.push(Book.new(title, author)) unless found
      File.open(BOOKS_DB, 'w') { |file| file.write(@books.to_yaml) }
    end
  end

  def book_del(title)
    if @books.reject! { |book_i| book_i.title == title } != nil
      File.open(BOOKS_DB, 'w') { |file| file.write(@books.to_yaml) }
    end
  end

  def order_save(order)
    ex_cl(order, Order)
    @orders.push(order)
    File.open(ORDERS_DB, 'w') { |file| file.write(@orders.to_yaml) }
  end
end
