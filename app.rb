require_relative 'person'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'student'
require_relative 'rental'
require_relative 'book'

class App
  @@list_books = []
  @@list_persons = []
  def self.list_books
    @@list_books
  end

  def self.list_persons
    @@list_persons
  end

  # create a new person
  def self.create_person
    print 'Do you want to create a teacher(1) or student(2)? [Input the number] : '
    nb = gets.chomp.to_i
    unless [1, 2].include?(nb)
      puts 'Invalid : You must enter 1 ou 2'
      create_person
    end
    case nb
    when 1
      print 'Name: '
      name = gets.chomp
      print 'Age: '
      age = gets.chomp
      print 'Specialisation: '
      spc = gets.chomp
      new_person = Teacher.new(spc, age, name)
      puts 'Teacher created successfully'
      App.list_persons.push(new_person)
    when 2
      print 'Name: '
      name = gets.chomp
      print 'Age: '
      age = gets.chomp.to_i
      print('Has parent permission? (Y/N: ')
      per = gets.chomp
      new_person = Student.new(age, name)
      new_person.parent_permission = per
      puts 'Student created successfully'
      App.list_persons.push(new_person)
    end
  end

  # Create a new  book
  def self.create_book
    print 'Title: '
    tl = gets.chomp
    print 'Author: '
    au = gets.chomp
    new_book = Book.new(tl, au)
    App.list_books.push(new_book)
    puts 'Book created and added to book list successfully'
  end

  # create a new rental
  def self.create_rental
    puts 'Select a book from the following list by number: '
    App.list_books.each do |book, index = 0|
      puts "#{index + 1}) Title: #{book.title} by Author: #{book.author}"
    end
    book_index = gets.chomp.to_i - 1
    if book_index.zero? || book_index >= book.length ||
      (
        begin
          Integer(book_index)
          false
        rescue
          true
        end
      )
      puts 'Please enter a book valid number'
      create_rental
    end
    book = App.list_books[book_index]
    puts 'Select a person from the following list by number: '
    App.list_persons.each do |person, index = 0|
      print "#{index + 1}) "
      if person.respond_to?(:specialisation)
        puts "#{index + 1} [Teacher] Name: #{person.name}
              ID: #{person.id} Age: #{person.age} old is a #{person.specialisation}"
      end
      if person.respond_to?(:parent_permission)
        puts "#{index + 1} [Student] Name: #{person.name}  ID: #{person.id}
        Age: #{person.age} old has permissions: #{person.parent_permission} "
      end
    end
    person_index = gets.chomp.to_i - 1
    person = App.list_persons[person_index]
    print 'Date: '
    date = gets.chomp
    book.add_rental(person, date)
    puts 'Rental created successfully'
  end

  # list all rental for a given person
  def self.list_rental
    puts 'Select a person from the following list by number: '
    App.list_persons.each do |person, index = 0|
      puts "#{index + 1}) #{person.name}"
    end
    person_index = gets.chomp.to_i - 1
    person = App.list_persons[person_index]
    person.rentals.each do |rental|
      puts "#{rental.book.title} by #{rental.book.author} on #{rental.date}"
    end
  end
end
