require 'yaml'
require File.expand_path("../../", __FILE__)+'/conf/conf'
require File.expand_path("..", __FILE__)+'/author'
require File.expand_path("..", __FILE__)+'/book'
require File.expand_path("..", __FILE__)+'/order'
require File.expand_path("..", __FILE__)+'/reader'

class Library
  include Conf

  attr_accessor :authors, :books, :readers, :orders

  def initialize
    @authors = []
    @books = []
    @readers = []
    @orders = []
    
    open()
  end

  def open
    @authors = YAML.load_file(AUTHORS_DB) if File.exist?(AUTHORS_DB)
    #@books = YAML.load_file(BOOKS_DB) if File.exist?(BOOKS_DB)
    #@readers = YAML.load_file(READERS_DB) if File.exist?(READERS_DB)
    #@orders = YAML.load_file(ORDERS_DB) if File.exist?(ORDERS_DB)
  end

  def test
    puts authors
  end

  def save

  end

  def top_reader

  end

  def most_popular_books

  end

  def number_of_readers_of_the_most_popular_books

  end

  def author_add(name, biography = "")
    found = false

    @authors.each { |author| found = true if author.name == name}

    unless found
      author_new = Author.new(name, biography)
      @authors.push(author_new) unless found
      File.open(AUTHORS_DB, 'w') { |file| file.write(@authors.to_yaml) }
    end
    #open()
  end

  def author_del(name)
    if @authors.reject! { |author| author.name == name } != nil
      File.open(AUTHORS_DB, 'w') { |file| file.write(@authors.to_yaml) }
    end
  end

  def book_add(title, author)
   #author = Author.new("Ivan", "good")
   @books = Book.new(title, author)
   File.open(AUTHORS_DB, 'a') { |file| file.write(@books.to_yaml) }
  end

end
