module Conf
  ROOTDIR = File.expand_path("../../", __FILE__)
  AUTHORS_DB = ROOTDIR + '/db/authors.yaml' 
  BOOKS_DB = ROOTDIR + '/db/books.yaml' 
  READERS_DB = ROOTDIR + '/db/readers.yaml' 
  ORDERS_DB = ROOTDIR + '/db/orders.yaml' 

  def ex_s(var, val = "")
    raise "#{self.class} #{val} not valid" unless var.is_a?(String) && !var.empty?
    return var
  end

  def ex_i(var, val = "")
    raise "#{self.class} #{val} not valid" unless var.is_a?(Integer) && var > 0
    return var
  end

  def ex_cl(var, val)
    raise "#{self.class} #{val} not valid" unless var.instance_of?(val)
    return var
  end

  def ex_dt(var, val)
    raise "#{self.class} #{val} not valid" unless var.instance_of?(Time)
    return var
  end
end
