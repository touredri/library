require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
class BookManager
  @list_books = []

  class << self
    attr_reader :list_books
  end

  def self.create_book
    print 'Title: '
    tl = gets.chomp
    print 'Author: '
    au = gets.chomp
    list_books.push(Book.new(tl, au))
    puts 'Book created and added to the book list successfully'
  end

  def self.list_book
    puts 'This is the list of Books'
    list_books.each_with_index do |book, i|
      puts "#{i + 1}) Title: #{book.title} by Author: #{book.author}"
    end
  end
end
