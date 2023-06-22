require_relative 'person'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'student'
require_relative 'rental'
require_relative 'book'


class App
  attr_accessor :listBooks, :listPersons

  puts "Welcome to School library App"


  def add_to_book_list(book)
    @listBooks << book
  end
  def add_to_person_list(person)
    @listPerson << person
  end

  def create_person
    puts "Do you want to create a teacher(1) or student(2)? [Input the number]"
    nb = gets.chomp
    if nb.nil? || nb.empty? || nb != 1 || nb != 2
      puts "Invalid: Input must be 1 or 2"
    end
    if nb == 1
      print "Name: "
      name = gets.chomp
      print "Age: "
      age = gets.chomp
      print "Specialisation: "
      spc = gets.chomp
      new_person = Teacher.new(name, age, spc)
      puts "Person created "
      @listPersons << new_person
      #self.make_choice()
    end
    if nb == 2
      print "Name: "
      name = gets.chomp
      print "Age: "
      age = gets.chomp
      print "Has parent permission? (Y/F: "
      per = gets.chomp
      new_person = Teacher.new(name, age, per)
      puts "Person created "
      @listPersons << new_person
      #self.make_choice()
    end
  end
  def create_book
    puts "Title: "
    tl = gets.chomp
    puts "Author: "
    au = gets.chomp
    new_book = Book.new(tl, au)
    @listBooks << new_book
  end
end
