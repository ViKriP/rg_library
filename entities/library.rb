class Library
  include Conf

  attr_accessor :authors, :readers, :books, :orders

  def initialize
    @authors = []
    @books = []
    @readers = []
    @orders = []

    open
  end

  def open
    @authors = YAML.load_file(AUTHORS_DB) if File.exist?(AUTHORS_DB)
    @readers = YAML.load_file(READERS_DB) if File.exist?(READERS_DB)
    @books = YAML.load_file(BOOKS_DB) if File.exist?(BOOKS_DB)
    @orders = YAML.load_file(ORDERS_DB) if File.exist?(ORDERS_DB)
  end

  def top_reader(quantity = 1)
    top_readers = {}

    @orders.each do |ord|
      top_readers.key?(ord.reader) ? top_readers[ord.reader] = top_readers[ord.reader] + 1 : top_readers[ord.reader] = 1
    end

    top_readers.sort { |a, b| b[1] <=> a[1] }[0...quantity]
  end

  def most_popular_books(quantity = 1)
    top_books = {}

    @orders.each do |ord|
      top_books.key?(ord.book) ? top_books[ord.book] = top_books[ord.book] + 1 : top_books[ord.book] = 1
    end

    top_books.sort { |a, b| b[1] <=> a[1] }[0...ex_i(quantity)]
  end

  def number_of_readers_of_the_most_popular_books(quantity = 3)
    a = most_popular_books(quantity)

    readers_top_books = []

    @orders.each do |ord|
      (0...ex_i(quantity)).each do |i|
        readers_top_books.push(ord.reader) if ord.book == a[i][0]
      end
    end

    readers_top_books.uniq.size
  end

  def statistics(top_readers, top_books, top_reader_books)
    a1 = top_reader(top_readers)
    puts "\n\r=========="
    puts "Top readers\n\r"
    (0...ex_i(top_readers)).each do |i|
      puts "Reader name - #{a1[i][0].name} | count book - #{a1[i][1]}"
    end

    a2 = most_popular_books(top_books)
    puts '----------'
    puts "Most popular books\n\r"
    (0...ex_i(top_books)).each do |i|
      puts "Book title - #{a2[i][0].title} | number taken - #{a2[i][1]}"
    end

    a2 = most_popular_books(top_reader_books)

    readers_top_books = []
    r_book = []

    @orders.each do |ord|
      (0...ex_i(top_reader_books)).each do |i|
        readers_top_books.push(ord.reader) && r_book.push(a2[i][0].title) if ord.book == a2[i][0]
      end
    end

    puts '----------'
    puts "Statistics readers of the most popular books\n\r"
    puts "Books - #{top_reader_books}\n\r"
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
    ex_cl(author_input, Author)
    entities_add(entities_input: author_input, path_db: AUTHORS_DB, arr: @authors)
  end

  def author_del(author_out)
    ex_cl(author_out, Author)
    entities_del(author_out, AUTHORS_DB, @authors)
  end

  def reader_name(name)
    found = nil
    @readers.each { |reader_i| found = reader_i if reader_i.name == name }
    found
  end

  def reader_add(reader_input)
    ex_cl(reader_input, Reader)
    entities_add(entities_input: reader_input, path_db: READERS_DB, arr: @readers)
  end

  def reader_del(reader_out)
    ex_cl(reader_out, Reader)
    entities_del(reader_out, READERS_DB, @readers)
  end

  def book_title(title)
    found = nil
    @books.each { |book_i| found = book_i if book_i.title == title }
    found
  end

  def book_add(book_input)
    ex_cl(book_input, Book)
    entities_add(entities_input: book_input, path_db: BOOKS_DB, arr: @books)
  end

  def book_del(book_out)
    ex_cl(book_out, Book)
    entities_del(reader_out, BOOKS_DB, @books)
  end

  def order_save(order)
    ex_cl(order, Order)
    @orders.push(order)
    File.open(ORDERS_DB, 'w') { |file| file.write(@orders.to_yaml) }
    order
  end

  def order_db_clear
    @orders.clear
    File.open(ORDERS_DB, 'w') { |file| file.write(@orders.to_yaml) }
  end
end
