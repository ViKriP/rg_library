# frozen_string_literal: true

ROOTDIR = File.expand_path(__dir__)
AUTHORS_DB = ROOTDIR + '/db/authors.yaml'
BOOKS_DB = ROOTDIR + '/db/books.yaml'
READERS_DB = ROOTDIR + '/db/readers.yaml'
ORDERS_DB = ROOTDIR + '/db/orders.yaml'

require 'yaml'
require ROOTDIR + '/conf/validation'
require ROOTDIR + '/entities/author'
require ROOTDIR + '/entities/book'
require ROOTDIR + '/entities/order'
require ROOTDIR + '/entities/reader'
require ROOTDIR + '/entities/statistics'
require ROOTDIR + '/entities/library'
require ROOTDIR + '/start_data'
