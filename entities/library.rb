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

  def top_reader(quantity = 1)
    top_readers = Hash.new

    @orders.each do |ord|
      top_readers.key?(ord.reader) ? top_readers[ord.reader] = top_readers[ord.reader]+1 : top_readers[ord.reader] = 1 
    end

    a = top_readers.sort{|a,b| b[1]<=>a[1]}[0..quantity-1]

    puts "----------"
    puts "Top readers\n\r"
    (0..ex_i(quantity)-1).each do |i| 
      puts "Reader name - #{a[i][0].name} | count book - #{a[i][1]}"
    end
  end

  def top_book(quantity)
    top_books = Hash.new

    @orders.each do |ord|
      top_books.key?(ord.book) ? top_books[ord.book] = top_books[ord.book]+1 : top_books[ord.book] = 1 
    end

    a = top_books.sort{|a,b| b[1]<=>a[1]}[0..quantity-1]

    return a
  end

  def most_popular_books(quantity = 1)
    a = top_book(quantity)

    puts "----------"
    puts "Most popular books\n\r"
    (0..ex_i(quantity)-1).each do |i| 
      puts "Book title - #{a[i][0].title} | number taken - #{a[i][1]}"
    end
  end

  def number_of_readers_of_the_most_popular_books(quantity = 3)
    a = top_book(quantity)

    readers_top_books = []
    r_book = []

    @orders.each do |ord|
      (0..ex_i(quantity)-1).each do |i|
        readers_top_books.push(ord.reader) && r_book.push(a[i][0].title) if ord.book == a[i][0]
      end 
    end

    puts "----------"
    puts "Statistics readers of the most popular books\n\r"
    puts "Books - #{quantity}\n\r"
    puts r_book.uniq
    
    puts "\n\rALL Readers top books - #{readers_top_books.count}\n\r"
    readers_top_books.each do |r| 
      puts "Reader - #{r.name}"
    end

    arr = readers_top_books.uniq
 
    puts "\n\rUNIQ Readers top books - #{arr.count}\n\r"
    arr.each do |r| 
      puts "Reader - #{r.name}"
    end
    puts "\n\rNumber of readers of the most popular books = #{arr.count}"
  end

  def author(name)
    found = nil
    @authors.each { |author_i| found = author_i if author_i.name == name}
    return found
  end

  def author_add(name, biography = "")
    found = false

    @authors.each { |author_i| found = author_i if author_i.name == name}

    unless found
      author_new = Author.new(name, biography)
      @authors.push(author_new) unless found
      File.open(AUTHORS_DB, 'w') { |file| file.write(@authors.to_yaml) }
      return author_new
    else
      return found
    end
  end

  def author_del(name)
    if @authors.reject! { |author_i| author_i.name == name } != nil
      File.open(AUTHORS_DB, 'w') { |file| file.write(@authors.to_yaml) }
    end
  end

  def reader_name(name)
    found = nil
    @readers.each { |reader_i| found = reader_i if reader_i.name == name}
    return found
  end

  def reader_add(name, email, city, street, hous)
    found = false

    @readers.each { |reader_i| found = reader_i if reader_i.name == name}

    unless found
      reader_new = Reader.new(name, email, city, street, hous)
      @readers.push(reader_new) unless found
      File.open(READERS_DB, 'w') { |file| file.write(@readers.to_yaml) }
      return reader_new
    else
      return found
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

    @books.each { |book_i| found = book_i if book_i.title == title}

    unless found
      book_new = Book.new(title, author)
      @books.push(book_new) unless found
      File.open(BOOKS_DB, 'w') { |file| file.write(@books.to_yaml) }
      return book_new
     else
      return found
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
    return order
  end

  def order_db_clear
    @orders.clear
    File.open(ORDERS_DB, 'w') { |file| file.write(@orders.to_yaml) }
  end
end
