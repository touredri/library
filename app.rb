require_relative 'person'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'student'
require_relative 'rental'
require_relative 'book'


class App
  @@listPersons = []
  @@listBooks = []

  def self.create_person
    puts "Do you want to create a teacher(1) or student(2)? [Input the number]"

    unless [1, 2].include?(nb)
      puts "Invalide : Vous devez entrer 1 ou 2"
      nb = gets.chomp
    end
    case nb
    when 1
      print "Name: "
      name = gets.chomp
      print "Age: "
      age = gets.chomp
      print "Specialisation: "
      spc = gets.chomp
      new_person = Teacher.new(name, age, spc)
      puts "Person created "
      @listPersons << new_person
      # self.make_choice()
    when  2
      print "Name: "
      name = gets.chomp
      print "Age: "
      age = gets.chomp
      print("Has parent permission? (Y/F: ")
      per = gets.chomp
      new_person = Teacher.new(name, age, per)
      puts "Person created "
      @listPersons << new_person
      # self.make_choice()
    end
  end

  def self.create_book
    puts "Title: "
    tl = gets.chomp
    puts "Author: "
    au = gets.chomp
    new_book = Book.new(tl, au)
    @listBooks << new_book
  end

  def self.create_rental
    p "Select a book from the following list by number: "
    @listBooks.each do |book, index|
      p "#{index + 1}. #{book.title} by #{book.author}"
    end
    book_index = gets.chomp.to_i - 1
    book = @listBooks[book_index]
    p "Select a person from the following list by number: "
    @listPersons.each do |person, index|
      p "#{index + 1}. #{person.name}"
    end
    person_index = gets.chomp.to_i - 1
    person = @listPersons[person_index]
    p "Date: "
    date = gets.chomp
    new_rental = Rental.new(date, book, person)
    puts "Rental created "
  end
  # list all rental for a given person id
  def self.list_rental
    p "Select a person from the following list by number: "
    @listPersons.each do |person, index|
      p "#{index + 1}. #{person.name}"
    end
    person_index = gets.chomp.to_i - 1
    person = @listPersons[person_index]
    person.rentals.each do |rental|
      p "#{rental.book.title} by #{rental.book.author} on #{rental.date}"
    end
  end
end
