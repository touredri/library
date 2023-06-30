require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
class PersonManager
  @list_persons = []

  class << self
    attr_reader :list_persons
  end

  def PersonManager.create_person
    print 'Do you want to create a teacher(1) or student(2)? [Input the number]: '
    nb = gets.chomp.to_i
    case nb
    when 1
      create_teacher
    when 2
      create_student
    else
      puts 'Invalid: You must enter 1 or 2'
      create_person
    end
  end

  def self.create_teacher
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Specialisation: '
    spc = gets.chomp
    list_persons.push(Teacher.new(spc, age, name))
    puts 'Teacher created successfully'
  end

  def self.create_student
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Has parent permission? (Y/N): '
    per = gets.chomp
    new_person = Student.new(age, name)
    new_person.parent_permission = per
    puts 'Student created successfully'
    list_persons.push(new_person)
  end

  def self.list_person
    puts 'This is the list of persons: '
    list_persons.each_with_index do |person, index|
      print "#{index + 1}) "
      display_person_info(person)
    end
  end

  def self.display_person_info(person)
    if person.respond_to?(:specialisation)
      puts "[Teacher] Name: #{person.name} ID: #{person.id}
        Age: #{person.age} old is a #{person.specialisation}"
    end
    if person.respond_to?(:classroom)
      puts "[Student] Name: #{person.name} ID: #{person.id}
        Age: #{person.age} old has permissions: #{person.parent_permission}"
    end
  end

  def self.person_list_rentals
    self.list_person
    puts 'Enter the ID of the person you want to see the rentals: '
    id = gets.chomp.to_i
    person = list_persons.find { |persons| persons.id == id }
    if person.nil?
      puts 'Person not found! Try entering a valid ID'
      self.person_list_rentals
    else
      puts "This is the list of rentals for #{person.name}: "
      person.rentals.each do |rental|
        puts "Book: #{rental.book.title} by #{rental.book.author} Rental date: #{rental.date}"
      end
    end
  end
end
