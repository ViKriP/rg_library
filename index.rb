require File.expand_path("..", __FILE__)+'/entities/library'

lib = Library.new

lib.author_add("Lev Tolstoy")
lib.author_add("Gustave Flaubert")
lib.author_add("Mark Twain")
lib.author_add("George Eliot")
lib.author_add("Herman Melville")
lib.author_add("Charles Dickens")
lib.author_add("Fedor Dostoevsky")
lib.author_add("Jane Austen")

lib.book_add("War and Peace", lib.author("Lev Tolstoy"))
lib.book_add("Anna Karenina", lib.author("Lev Tolstoy"))
lib.book_add("Madame Bovary", lib.author("Gustave Flaubert"))
lib.book_add("The Adventures of Huckleberry Finn", lib.author("Mark Twain"))
lib.book_add("Middlemarch", lib.author("George Eliot"))
lib.book_add("Moby Dick", lib.author("Herman Melville"))
lib.book_add("Great expectations", lib.author("Charles Dickens"))
lib.book_add("Crime and Punishment", lib.author("Fedor Dostoevsky"))
lib.book_add("Emma", lib.author("Jane Austen"))

=begin
lib.reader_add("Liona","l@l.com","Dnepr","Polya",5)
lib.reader_add("Liona","l@l.com","Dnepr","Polya",5)
lib.reader_add("Liona","l@l.com","Dnepr","Polya",5)
lib.reader_add("Liona","l@l.com","Dnepr","Polya",5)
lib.reader_add("Liona","l@l.com","Dnepr","Polya",5)
lib.reader_add("Liona","l@l.com","Dnepr","Polya",5)
lib.reader_add("Liona","l@l.com","Dnepr","Polya",5)
lib.reader_add("Liona","l@l.com","Dnepr","Polya",5)
lib.reader_add("Liona","l@l.com","Dnepr","Polya",5)
=end

lib.order_save(Order.new(book1, reader1, Time.now))



auth1 = lib.author("Maxima")

#lib.author_del("Maxima")

lib.reader_add("Liona","l@l.com","Dnepr","Polya",5)

reader1 = lib.reader("Liona")

#lib.reader_del("Liona")

lib.book_add("Helper", auth1)

book1 = lib.book("Helper")

#lib.book_del("Helper")


order1 = Order.new(book1, reader1, Time.now)

lib.order_save(order1)

lib.test






#author = Author.new("Tom","Good man")
#author.some_method
#puts "Author - #{author.name}\nbiography - #{author.biography}"

#lib.book_add("Helper2", author)

#book = Book.new("Ruby", author)
#puts "Book title - #{book.title}\nAuthor name - #{author.name}\nAuthor biography - #{author.biography}"
