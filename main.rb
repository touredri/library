require_relative 'person'
require_relative 'student'
require_relative 'rental'
require_relative 'book'
require_relative 'app'
def main
  choice_list
  nbr = gets.chomp.to_i
  list_cases(nbr)
  main
end
def choice_list
  puts 'Please choose an option by entering a number'
  puts '1 - List all Books'
  puts '2 - List all Person'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a Rental'
  puts '6 - List all Rentals for a given person'
  puts '7 - Exit'
end
def list_cases(choice)
  options = {
    1 => :list_book,
    2 => :list_person,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rental,
  }

  if options.key?(choice)
    App.send(options[choice])
  elsif nb == 7
    puts 'Goodbye'
    exit
  else
    puts 'Invalid: You must choose one of the following options (number)'
  end
end
def person_details(person)
  if person.respond_to?(:specialisation)
    "[Teacher] Name: #{person.name}  ID: #{person.id}
    Age: #{person.age} old is a #{person.specialisation}"
  elsif person.respond_to?(:classroom)
    "[Student] Name: #{person.name}  ID: #{person.id}
    Age: #{person.age} old has permissions: #{person.parent_permission}"
  end
end

puts 'Welcome to School library App'
main
