require './student'
require './teacher'
require './book'
require './rental'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def add_person(person)
    @people << person unless @people.include?(person)
  end

  def add_rental(rental)
    @rentals << rental unless @rentals.include?(rental)
  end

  def add_book(book)
    @books << book unless @books.include?(book)
  end
end
