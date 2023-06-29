# require_relative 'app'
class Book
  attr_accessor :name, :author, :rentals, :title

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @id = Random.rand(1..1000)
  end

  def add_rental(person, date, rental_manager)
    rental_manager.create_rental(date, self, person)
  end
end
