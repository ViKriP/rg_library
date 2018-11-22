# frozen_string_literal: true

author1 = Author.new('Lev Tolstoy')
author2 = Author.new('Gustave Flaubert')
author3 = Author.new('Mark Twain')
author4 = Author.new('George Eliot')
author5 = Author.new('Herman Melville')
author6 = Author.new('Charles Dickens')
author7 = Author.new('Fedor Dostoevsky')
author8 = Author.new('Jane Austen')

book1 = Book.new('War and Peace', author1)
book2 = Book.new('Anna Karenina', author1)
book3 = Book.new('Madame Bovary', author2)
book4 = Book.new('The Adventures of Huckleberry Finn', author3)
book5 = Book.new('Middlemarch', author4)
book6 = Book.new('Moby Dick', author5)
book7 = Book.new('Great expectations', author6)
book8 = Book.new('Crime and Punishment', author7)
book9 = Book.new('Emma', author8)

reader1 = Reader.new('Lena', 'l@gmail.com', 'Dnepr', 'St. Polya', 5)
reader2 = Reader.new('Den', 'd@gmail.com', 'Dnepr', 'St. Korolenko', 15)
reader3 = Reader.new('Kira', 'k@gmail.com', 'Dnepr', 'St. Havana', 20)
reader4 = Reader.new('Marta', 'm@gmail.com', 'Dnepr', 'St. Glinka', 7)
reader5 = Reader.new('Max', 'mm@gmail.com', 'Dnepr', 'St. Glinka', 18)
reader6 = Reader.new('Ron', 'r@gmail.com', 'Dnepr', 'St. Glinka', 44)
reader7 = Reader.new('Alf', 'a@gmail.com', 'Dnepr', 'St. Zalivnaya', 88)
reader8 = Reader.new('Ivan', 'i@gmail.com', 'Dnepr', 'St. Zalivnaya', 9)
reader9 = Reader.new('Dina', 'dd@gmail.com', 'Dnepr', 'St. Korolenko', 22)

order1 = Order.new(book1, reader1, Time.local(2017, 1, 1, 20, 15, 1))
order2 = Order.new(book1, reader7, Time.local(2017, 1, 5, 20, 15, 1))
order3 = Order.new(book2, reader2, Time.local(2017, 1, 5, 20, 15, 1))
order4 = Order.new(book2, reader3, Time.local(2017, 1, 10, 20, 15, 1))
order5 = Order.new(book2, reader4, Time.local(2017, 1, 11, 20, 15, 1))
order6 = Order.new(book3, reader7, Time.local(2017, 2, 1, 20, 15, 1))
order7 = Order.new(book4, reader9, Time.local(2017, 2, 1, 20, 15, 1))
order8 = Order.new(book5, reader8, Time.local(2017, 3, 2, 20, 15, 1))
order9 = Order.new(book6, reader2, Time.local(2017, 3, 5, 20, 15, 1))
order10 = Order.new(book6, reader3, Time.local(2017, 3, 10, 20, 15, 1))
order11 = Order.new(book6, reader4, Time.local(2017, 4, 10, 20, 15, 1))
order12 = Order.new(book6, reader5, Time.local(2017, 4, 10, 20, 15, 1))
order13 = Order.new(book6, reader6, Time.local(2017, 5, 12, 20, 15, 1))
order14 = Order.new(book7, reader9, Time.local(2017, 5, 20, 20, 15, 1))
order15 = Order.new(book7, reader1, Time.local(2017, 6, 3, 20, 15, 1))
order16 = Order.new(book8, reader7, Time.local(2017, 6, 5, 20, 15, 1))
order17 = Order.new(book6, reader7, Time.local(2017, 6, 6, 20, 15, 1))
order18 = Order.new(book8, reader6, Time.local(2017, 7, 4, 20, 15, 1))
order19 = Order.new(book8, reader8, Time.local(2017, 7, 12, 20, 15, 1))
order20 = Order.new(book9, reader9, Time.local(2017, 8, 9, 20, 15, 1))
order21 = Order.new(book9, reader7, Time.local(2017, 9, 11, 20, 15, 1))

lib1 = Library.new

lib1.clear_db

lib1.add_entity(author1)
lib1.add_entity(author2)
lib1.add_entity(author3)
lib1.add_entity(author4)
lib1.add_entity(author5)
lib1.add_entity(author6)
lib1.add_entity(author7)
lib1.add_entity(author8)

lib1.add_entity(book1, book2, book3, book4, book5, book6, book7, book8, book9)

lib1.add_entity(reader1, reader2, reader3, reader4, reader5, reader6, reader7, reader8, reader9)

lib1.add_entity(order1, order2, order3, order4, order5, order4, order5,
                order6, order7, order8, order9, order10, order11, order12,
                order13, order14, order15, order16, order17, order18, order19,
                order20, order21)

lib1.save
