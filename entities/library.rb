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

  def add_entity(*entities)
    entities.each do |entity|
      case entity
      when Author
        @authors.push(entity)
      when Reader
        @readers.push(entity)
      when Book
        @books.push(entity)
      when Order
        @orders.push(entity)
      end
    end
  end

  def db_clear
    clear_yml(AUTHORS_DB, @authors)
    clear_yml(READERS_DB, @readers)
    clear_yml(BOOKS_DB, @books)
    clear_yml(ORDERS_DB, @orders)
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

  def clear_yml(path, arr)
    File.open(path, 'w') { |file| file.write(arr.clear.to_yaml) }
  end
end
