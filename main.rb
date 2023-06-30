require_relative 'person'
require_relative 'student'
require_relative 'rental'
require_relative 'book'
require_relative 'app'
require_relative 'menu_handler'

puts 'Welcome to School Library App'

menu_handler = MenuHandler.new
menu_handler.load_data

loop do
  menu_handler.display_menu
  choice = gets.chomp.to_i
  menu_handler.handle_choice(choice)
end

puts 'Goodbye'
