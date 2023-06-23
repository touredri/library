require_relative 'app'
class Book
  attr_accessor :name, :author, :rentals, :title
  #attr_reader :id
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @id = Random.rand(1..1000)
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
