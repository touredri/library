require_relative 'person'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'student'
require_relative 'rental'
require_relative 'book'

class App
  @list_books = []
  @list_persons = []

  class << self
    attr_reader :list_books, :list_persons
  end

  # create a new person
  def self.create_person
    print 'Do you want to create a teacher(1) or student(2)? [Input the number]: '
    nb = gets.chomp.to_i
    case nb
    when 1
      print 'Name: '; name = gets.chomp
      print 'Age: '; age = gets.chomp
      print 'Specialisation: '; spc = gets.chomp
      new_person = Teacher.new(spc, age, name)
      puts 'Teacher created successfully'
      list_persons.push(new_person)
    when 2
      print 'Name: '; name = gets.chomp
      print 'Age: '; age = gets.chomp.to_i
      print 'Has parent permission? (Y/N): '; per = gets.chomp
      new_person = Student.new(age, name)
      new_person.parent_permission = per
      puts 'Student created successfully'
      list_persons.push(new_person)
    else
      puts 'Invalid: You must enter 1 or 2'
      create_person
    end
  end

  # Create a new book
  def self.create_book
    print 'Title: '
    tl = gets.chomp
    print 'Author: '
    au = gets.chomp
    new_book = Book.new(tl, au)
    list_books.push(new_book)
    puts 'Book created and added to the book list successfully'
  end

  # List all books
  def self.list_book
    puts 'This is the list of Books'
    list_books.each_with_index do |book, i|
      puts "#{i + 1}) Title: #{book.title} by Author: #{book.author}"
    end
  end

  # List all persons
  def self.list_person
    puts 'This is the list of persons: '
    list_persons.each_with_index do |person, index|
      print "#{index + 1}) "
      if person.respond_to?(:specialisation)
        puts "[Teacher] Name: #{person.name} ID: #{person.id}
        Age: #{person.age} old is a #{person.specialisation}"
      end
      if person.respond_to?(:classroom)
        puts "[Student] Name: #{person.name} ID: #{person.id}
        Age: #{person.age} old has permissions: #{person.parent_permission}"
      end
    end
  end

  # Create a new rental
  def self.create_rental
    puts 'Select a book from the following list by number: '
    list_book
    book_index = Integer(gets.chomp.to_i - 1) rescue nil
    if book_index.nil? || book_index.negative? || book_index >= list_books.length
      puts 'Please enter a valid book number'
      create_rental
    end
    book = list_books[book_index]
    puts 'Select a person from the following list by number: '
    list_person
    person_index = gets.chomp.to_i - 1
    person = list_persons[person_index]
    print 'Date: '
    date = gets.chomp
    book.add_rental(person, date)
    puts 'Rental created successfully'
  end

  # List all rentals for a given person
  def self.list_rental
    print 'Enter the ID of the person: '
    person_id = gets.chomp.to_i
    person_ = list_persons.find { |person| person.id == person_id }
    if person_.nil?
      puts 'Person not found'
      return
    end
    person_.rentals.each do |rental|
      puts "Book \"#{rental.book.title}\" by #{rental.book.author} on #{rental.date}"
    end
  end
end
