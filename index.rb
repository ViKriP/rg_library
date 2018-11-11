require File.expand_path(__dir__) + '/autoloader'

author1 = Author.new('Sergey Dovlatov')
author2 = Author.new('Vladimir Nabokov')

book1 = Book.new('Suitcase', author1)
book2 = Book.new('Lolita', author2)

reader1 = Reader.new('Artur', 'l@gmail.com', 'Dnepr', 'St. Polya', 5)
reader2 = Reader.new('Svetlana', 'd@gmail.com', 'Dnepr', 'St. Korolenko', 15)

lib = Library.new

lib.author_add(author1)
lib.author_add(author2)

lib.author_name('Sergey Dovlatov')
lib.author_name('Vladimir Nabokov')

book1_lib = lib.book_add(book1)
book2_lib = lib.book_add(book2)

lib.book_title('Suitcase')
book4_lib = lib.book_title('Lolita')

reader1_lib = lib.reader_add(reader1)
reader2_lib = lib.reader_add(reader2)

lib.reader_name('Artur')
reader4_lib = lib.reader_name('Svetlana')

lib.order_save(Order.new(book1_lib, reader1_lib))
lib.order_save(Order.new(book2_lib, reader2_lib))
lib.order_save(Order.new(lib.book_title('Suitcase'), lib.reader_name('Artur'),
                                         Time.local(2017, 1, 10, 20, 15, 1)))
lib.order_save(Order.new(book4_lib, reader4_lib,
  Time.local(2017, 1, 10, 20, 15, 1)))

order5 = Order.new(book4_lib, reader4_lib)

lib.order_save(order5)

puts lib.top_reader(4)

puts lib.most_popular_books(4)

puts lib.number_of_readers_of_the_most_popular_books(4)

lib.statistics(4, 4, 4)
