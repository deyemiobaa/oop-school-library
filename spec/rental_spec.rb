require '../rental'
require '../student'
require '../book'

describe Rental do
  it 'is an instance of Rental' do
    student = Student.new(15, 'John', false, 'classroom')
    book = Book.new('Harry Potter', 'JK Rowling')
    rental = Rental.new('2022/09/10', student, book)
    expect(rental).to be_instance_of(Rental)
  end
end
