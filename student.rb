require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, classroom, parent_permission)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
