require_relative 'person_manager'
require_relative 'book_manager'
require_relative 'rental_manager'

class MenuHandler
  def display_menu
    puts 'Please choose an option by entering a number'
    puts '1 - List all Books'
    puts '2 - List all Persons'
    puts '3 - Create a Person'
    puts '4 - Create a Book'
    puts '5 - Create a Rental'
    puts '6 - List all Rentals for a given person'
    puts '7 - Quit'
  end

  def handle_choice(choice)
    # person_manager = PersonManager.new
    # book_manager = BookManager.new
    # rental_manager = RentalManager.new

    case choice
    when 1
      BookManager.list_book
    when 2
      PersonManager.list_person
    when 3
      PersonManager.create_person
    when 4
      BookManager.create_book
    when 5
      RentalManager.create_rental
    when 6
      PersonManager.person_list_rentals
    when 7
      puts 'Goodbye'
      exit!
    else
      puts 'Invalid choice. Please enter a valid option number.'
    end
  end

  def quit?
    @choice == 7
  end
end
