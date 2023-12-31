# require_relative 'app'
class Rental
  attr_accessor :book, :person, :date

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals.push(self) unless book.rentals.include?(self)
    @person = person
    person.rentals.push(self) unless person.rentals.include?(self)
  end

  def calculate_due_date
    date + 10
  end

  def serialize
    {
      'date' => date,
      'person_id' => person.id,
      'book_id' => book.id
    }
  end
end
