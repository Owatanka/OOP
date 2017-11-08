require 'book'
require 'order'
require 'reader'
require 'author'
require 'yaml'

class Library

  attr_accessor :books, :orders, :readers, :authors

  DATA_DIR = "#{$PROJECT_DIR}/data"

  def initialize
    @books, @orders, @readers, @authors = [], [], [], []
  end

  def who_often_takes_the_book
    orders.group_by(&:reader).max {|a,b| a[1].size <=> a[1].size}[0]
  end

  def most_popular_book
    books_by_popularity[0]
  end

  def books_by_popularity
    orders.group_by(&:book).sort {|a,b| b[1].count <=> a[1].count}.map(&:first)
  end

  def users_takes_popular_book
    popular_books_orders = orders.select do |order|
      books_by_popularity[0..2].include?(order.book)
    end
    popular_books_orders.uniq(&:reader).count
  end

  def add_author(author)
    @authors <<  author unless authors.include? author
  end

  def add_book(book)
    @books <<  book unless books.include? book
    add_author(book.author)
  end

  def add_reader(reader)
    @readers <<  reader unless readers.include? reader
  end

  def add_order(order)
    @orders <<  order unless orders.include? order
    add_reader order.reader
  end

  def to_s
    "Books:\n" +
    "\t#{books.join("\n\t")}"+

    "\n\nAuthors:\n" +
    "\t#{authors.join("\n\t")}" +

    "\n\nReaders:\n" +
    "\t#{readers.join("\n\t")}" +

    "\n\nOrders:\n" +
    "\t#{orders.join("\n\t")}"

  end

  def save
      File.write("#{Library::DATA_DIR}/authors.yml", YAML.dump(@authors))
      File.write("#{Library::DATA_DIR}/books.yml", YAML.dump(@books))
      File.write("#{Library::DATA_DIR}/orders.yml", YAML.dump(@orders))
      File.write("#{Library::DATA_DIR}/readers.yml", YAML.dump(@readers))
  end

  def load
      @authors =  YAML.load(File.read("#{Library::DATA_DIR}/authors.yml"))
      @books =  YAML.load(File.read("#{Library::DATA_DIR}/books.yml"))
      @orders =  YAML.load(File.read("#{Library::DATA_DIR}/orders.yml"))
      @readers =  YAML.load(File.read("#{Library::DATA_DIR}/readers.yml"))
  end
end
