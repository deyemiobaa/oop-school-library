require './person'
require 'json'

class Teacher < Person
  attr_reader :specialization, :name, :age

  def initialize(name, age, specialization)
    super(age, name)
    @specialization = specialization
    @name = name
    @age = age
  end

  def can_use_services?
    true
  end

  def to_json(*_args)
    {
      name: @name,
      age: @age,
      specialization: @specialization
    }.to_json
  end

  def self.from_json(string)
    data = JSON.parse(string)
    new(data['name'], data['age'], data['specialization'])
  end
end
