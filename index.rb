# frozen_string_literal: true

require_relative 'autoloader'

author1 = Author.new('Sergey Dovlatov')
author2 = Author.new('Vladimir Nabokov')

book1 = Book.new('Suitcase', author1)
book2 = Book.new('Lolita', author2)

reader1 = Reader.new('Artur', 'l@gmail.com', 'Dnepr', 'St. Polya', 5)
reader2 = Reader.new('Svetlana', 'd@gmail.com', 'Dnepr', 'St. Korolenko', 15)

order1 = Order.new(book1, reader1, Time.local(2017, 1, 1, 20, 15, 1))
order2 = Order.new(book2, reader2, Time.local(2017, 1, 5, 20, 15, 1))

lib = Library.new

lib.add_entity(author1)

lib.add_entity(author2, book1, book2, order1)

lib.add_entity(order2)

puts lib.top_reader(4)
puts lib.most_popular_books(4)
puts lib.number_readers_top_books(4)

lib.save
