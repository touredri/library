require 'json'
require 'date'
require_relative 'person_manager'
require_relative 'book_manager'
require_relative 'rental_manager'

class DataManager
  def self.save_data(filename, data)
    serialized_data = data.map(&:serialize)
    File.open(filename, 'w') do |file|
      file.write(serialized_data.to_json)
    end
  end

  def self.load_data(filename)
    return {} unless File.exist?(filename)

    json_data = File.read(filename)
    unless json_data.empty?
      data = JSON.parse(json_data)
      case filename
      when 'persons.json'
        load_persons(data)
      when 'books.json'
        load_books(data)
      when 'rentals.json'
        load_rentals(data)
      end
    end
  end

  def self.load_persons(data)
    data.each do |person_data|
      case person_data['type']
      when 'student'
        person = Student.new(person_data['age'], person_data['name'])
        person.parent_permission = person_data['parent_permission']
      else
        person = Teacher.new(person_data['specialisation'], person_data['age'], person_data['name'])
      end
      person.id = person_data['id']
      PersonManager.list_persons.push(person)
    end
  end

  def self.load_books(data)
    data.each do |book_data|
      book = Book.new(book_data['title'], book_data['author'])
      book.id = book_data['id']
      BookManager.list_books.push(book)
    end
  end

  def self.load_rentals(data)
    data.each do |rental_data|
      book = BookManager.list_books.find { |books| books.id == rental_data['book_id'] }
      person = PersonManager.list_persons.find { |persons| persons.id == rental_data['person_id'] }
      rental_date = rental_data['date']
      rental = Rental.new(rental_date, book, person)
      RentalManager.list_rentals.push(rental)
    end
  end
end
