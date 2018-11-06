require File.expand_path("..", __FILE__)+'/entities/library'

lib = Library.new

lib.author_add("Maxima","Good man")
lib.author_add("Kim","Good man")

auth1 = lib.author("Maxima")

#lib.author_del("Maxima")

lib.reader_add("Liona","l@l.com","Dnepr","Polya",5)

reader1 = lib.reader("Liona")

#lib.reader_del("Liona")

lib.book_add("Helper", auth1)

book1 = lib.book("Helper")

#lib.book_del("Helper")




lib.test






#author = Author.new("Tom","Good man")
#author.some_method
#puts "Author - #{author.name}\nbiography - #{author.biography}"

#lib.book_add("Helper2", author)

#book = Book.new("Ruby", author)
#puts "Book title - #{book.title}\nAuthor name - #{author.name}\nAuthor biography - #{author.biography}"
