require File.expand_path("..", __FILE__)+'/entities/library'

lib = Library.new

author1 = lib.author_add("Sergey Dovlatov")
author2 = lib.author_add("Vladimir Nabokov")

author3 = lib.author("Sergey Dovlatov")
author4 = lib.author("Vladimir Nabokov")


book1 = lib.book_add("Suitcase", lib.author("Sergey Dovlatov"))
book2 = lib.book_add("Lolita", author4)

book3 = lib.book("Suitcase")
book4 = lib.book("Lolita")


reader1 = lib.reader_add("Artur","l@gmail.com","Dnepr","St. Polya",5)
reader2 = lib.reader_add("Svetlana","d@gmail.com","Dnepr","St. Korolenko",15)

reader3 = lib.reader("Artur")
reader4 = lib.reader("Svetlana")

=begin
order1 = lib.order_save(Order.new(book1, reader1))
order2 = lib.order_save(Order.new(book2, reader2))
order3 = lib.order_save(Order.new(lib.book("Suitcase"), lib.reader("Artur"), Time.local(2017,1,10,20,15,1)))
order4 = lib.order_save(Order.new(book4, reader4, Time.local(2017,1,10,20,15,1)))

order5 = Order.new(book4, reader4)
lib.order_save(order5)

lib.test
=end

lib.top_reader(3)

#puts "Author - #{author.name}\nbiography - #{author.biography}"
#puts "Book title - #{book1.title}\nAuthor name - #{author1.name}\nAuthor biography - #{author1.biography}"


