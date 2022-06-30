require '../rental'

describe Rental do
  it 'is an instance of Rental' do
    student = double('Student')
    book = double('Book')
    rental = Rental.new('2022/09/10', student, book)
    expect(rental).to be_instance_of(Rental)
  end
end
