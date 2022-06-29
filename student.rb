require './person'
require './classroom'
require 'json'

class Student < Person
  attr_reader :classroom, :parent_permission, :name, :age

  def initialize(age, name, parent_permission, classroom)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    @parent_permission = parent_permission
    @name = name
    @age = age
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_json(*_args)
    {
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      classroom: @classroom
    }.to_json
  end

  def self.from_json(string)
    data = JSON.parse(string)
    new(data['age'], data['name'], data['parent_permission'], data['classroom'])
  end
end
