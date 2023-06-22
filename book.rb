require_relative 'app'
class Book
  attr_accessor :name, :author, :rentals, :title

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
