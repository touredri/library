require_relative 'person'
require_relative 'student'
require_relative 'rental'
require_relative 'book'
require_relative 'app'
def main
  puts 'Please choose an option by entering a number'
  puts "1 - List all Books"
  puts "2 - List all Person"
  puts "3 - Create a person"
  puts "4 - Create a book"
  puts "5 - Create a Rental"
  puts "6 - List all Rentals for a given person"
  puts "7 - Exit"
  nbr = gets.chomp.to_i
  unless [1, 2, 3, 4, 5, 6, 7].include?(nbr)
    puts "Invalid : You must choose one of the following options(number)"
    main()
  end
  case nbr
  when 1
    puts "this is the list of Books"
    App.list_books.each do |book, i=0|
      p "#{i + 1}) Title: #{book.title} by Author: #{book.author}"
    end
  when 2
    puts 'this is the list of persons: '
    App.list_persons.each do |person, i=0|
      print "#{i + 1}"
      if person.respond_to?(:specialisation)
        puts "[Teacher] Name: #{person.name}  ID: #{person.id} Age: #{person.age} old is a #{person.specialisation}"
      end
      if person.respond_to?(:classroom)
        puts "[Student] Name: #{person.name}  ID: #{person.id} Age: #{person.age} old has permissions: #{person.parent_permission} "
      end
    end
  when 3
    App.create_person
  when 4
    App.create_book()
  when 5
    App.create_rental
  when 6
    App.list_rental
  when 7
    exit
  else
    puts "Please enter a valid number"
  end
  main()
end

p "Welcome to School library App"
main()