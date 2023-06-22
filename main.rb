require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'student'
require_relative 'rental'
require_relative 'book'
require_relative 'app'

def main
  p "Please choose an option by entering a number"
  p "1 - List all Books"
  p "2 - List all Person"
  p "3 - Create a person"
  p "4 - Create a book"
  p "5 - Create a Rental"
  p "6 - List all Rentals for a given person id"
  p "7 - Exit"
  nbr = gets.chomp
  case nbr
  when 1
    @listBooks.each do |element|
      puts element
    end
  when 2
    @listPerson.each do |element|
      puts element
    end
  when 3
    App.create_person()
  when 4
    App.create_book()
  else
    # type code here
  end
  #self.main()
end
