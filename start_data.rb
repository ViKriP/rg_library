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

lib = Library.new

lib.author_add(author1)
lib.author_add(author2)
lib.author_add(author3)
lib.author_add(author4)
lib.author_add(author5)
lib.author_add(author6)
lib.author_add(author7)
lib.author_add(author8)

lib.book_add(book1)
lib.book_add(book2)
lib.book_add(book3)
lib.book_add(book4)
lib.book_add(book5)
lib.book_add(book6)
lib.book_add(book7)
lib.book_add(book8)
lib.book_add(book9)

lib.reader_add(reader1)
lib.reader_add(reader2)
lib.reader_add(reader3)
lib.reader_add(reader4)
lib.reader_add(reader5)
lib.reader_add(reader6)
lib.reader_add(reader7)
lib.reader_add(reader8)
lib.reader_add(reader9)

lib.order_db_clear

lib.order_save(Order.new(lib.book_title('War and Peace'), lib.reader_name('Lena'), Time.local(2017, 1, 1, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('War and Peace'), lib.reader_name('Alf'), Time.local(2017, 1, 5, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('Anna Karenina'), lib.reader_name('Den'), Time.local(2017, 1, 5, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('Anna Karenina'), lib.reader_name('Kira'), Time.local(2017, 1, 10, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('Anna Karenina'), lib.reader_name('Marta'), Time.local(2017, 1, 11, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('Madame Bovary'), lib.reader_name('Alf'), Time.local(2017, 2, 1, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('The Adventures of Huckleberry Finn'), lib.reader_name('Dina'),
                         Time.local(2017, 2, 1, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('Middlemarch'), lib.reader_name('Ivan'), Time.local(2017, 3, 2, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('Moby Dick'), lib.reader_name('Den'), Time.local(2017, 3, 5, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('Moby Dick'), lib.reader_name('Kira'), Time.local(2017, 3, 10, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('Moby Dick'), lib.reader_name('Marta'), Time.local(2017, 4, 10, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('Moby Dick'), lib.reader_name('Max'), Time.local(2017, 4, 10, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('Moby Dick'), lib.reader_name('Ron'),
                         Time.local(2017, 5, 12, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('Great expectations'), lib.reader_name('Dina'),
                         Time.local(2017, 5, 20, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('Great expectations'), lib.reader_name('Lena'),
                         Time.local(2017, 6, 3, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('Crime and Punishment'), lib.reader_name('Alf'),
                         Time.local(2017, 6, 5, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('Moby Dick'), lib.reader_name('Alf'), Time.local(2017, 6, 6, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('Crime and Punishment'), lib.reader_name('Ron'),
                         Time.local(2017, 7, 4, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('Crime and Punishment'), lib.reader_name('Ivan'),
                         Time.local(2017, 7, 12, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('Emma'), lib.reader_name('Dina'), Time.local(2017, 8, 9, 20, 15, 1)))
lib.order_save(Order.new(lib.book_title('Emma'), lib.reader_name('Alf'), Time.local(2017, 9, 11, 20, 15, 1)))
