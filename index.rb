require File.expand_path("..", __FILE__)+'/entities/library'

lib = Library.new

lib.author_add("Maxima","Good man")
lib.author_add("Kim","Good man")

lib.test
#lib.author_del("Maxima")

#lib.author_load


#author = Author.new("Tom","Good man")
#author.some_method
#puts "Author - #{author.name}\nbiography - #{author.biography}"

#lib.book_add("Helper2", author)

#book = Book.new("Ruby", author)
#puts "Book title - #{book.title}\nAuthor name - #{author.name}\nAuthor biography - #{author.biography}"
