class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
  end

  def rent_book=(book)
    @book = book
    book.add_rentals(self) unless book.rentals.include?(self)
  end

  def book_renter=(person)
    @person = person
    person.rent_book(self) unless person.books_rented.include?(self)
  end
end
