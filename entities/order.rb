require File.expand_path("../../", __FILE__)+'/conf/conf'

class Order
  include Conf

  attr_reader :book, :reader, :date
  
  def initialize(book, reader, date = Time.now)
    @book = ex_cl(book, Book)
    @reader = ex_cl(reader, Reader)
    @date = ex_dt(date, "date")

  end
end
