# frozen_string_literal: true

class Library
  include Validation
  include Statistics

  attr_accessor :authors, :readers, :books, :orders, :entities_lib

  def initialize
    @authors = []
    @books = []
    @readers = []
    @orders = []
    @entities_lib = {}
    load_datas
  end

  def load_datas
    @entities_lib = Hash[AUTHORS_DB => @authors = load_yml(AUTHORS_DB),
                         READERS_DB => @readers = load_yml(BOOKS_DB),
                         BOOKS_DB => @books = load_yml(ORDERS_DB),
                         ORDERS_DB => @orders = load_yml(ORDERS_DB)]
  end

  def save
    @entities_lib.each_pair { |key, val| save_yml(key, val) }
  end

  def clear_db
    @entities_lib.each_pair { |key, val| clear_yml(key, val) }
  end

  def add_entity(*entities)
    entities.each do |entity|
      case entity
      when Author then @authors.push(entity)
      when Reader then @readers.push(entity)
      when Book then @books.push(entity)
      when Order then @orders.push(entity)
      end
    end
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
