require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'data_manager'
require 'json'
class RentalManager
  @list_rentals = []
  class << self
    attr_reader :list_rentals
  end
  def self.create_rental
    puts 'Select a book from the following list by number: '
    BookManager.list_book
    book_index = Integer(gets.chomp.to_i - 1) rescue nil
    if book_index.nil? || book_index.negative? || book_index >= BookManager.list_books.length
      puts 'Please enter a valid book number'
      create_rental
    end
    book = BookManager.list_books[book_index]
    puts 'Select a person from the following list : '
    PersonManager.list_person
    person_index = gets.chomp.to_i - 1
    person = PersonManager.list_persons[person_index]
    print 'Date (YYYY-MM-DD): '
    date = gets.chomp
    list_rentals.push(Rental.new(date, book, person))
    puts 'Rental created successfully.'
  end
end
