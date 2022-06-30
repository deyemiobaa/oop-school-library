require_relative '../person'

describe Person do
  it 'has a name' do
    person = Person.new(40, 'John')
    expect(person.name).to eq('John')
  end

  it 'has an age' do
    person = Person.new(40, 'John')
    expect(person.age).to eq(40)
  end

  it 'can use services' do
    person = Person.new(40, 'John')
    expect(person.can_use_services?).to eq(true)
  end
end
