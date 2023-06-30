require_relative 'person_manager'
require_relative 'book_manager'
require_relative 'rental_manager'
require_relative 'data_manager'

class MenuHandler
  def load_data
    DataManager.load_data('persons.json')
    DataManager.load_data('books.json')
    DataManager.load_data('rentals.json')
  end

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
      save_data
      exit!
    else
      puts 'Invalid choice. Please enter a valid option number.'
    end
  end

  def save_data
    DataManager.save_data('persons.json', PersonManager.list_persons)
    DataManager.save_data('books.json', BookManager.list_books)
    DataManager.save_data('rentals.json', RentalManager.list_rentals)
  end
end
