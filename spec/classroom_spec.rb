require '../classroom'

describe Classroom do
  it 'has a label' do
    classroom = Classroom.new('English')
    expect(classroom.label).to eq('English')
  end

  it 'has students' do
    classroom = Classroom.new('English')
    expect(classroom.students).to eq([])
  end

  it 'can add students' do
    classroom = Classroom.new('English')
    student = double('Student')
    classroom.add_student(student)
    expect(classroom.students).to eq([student])
  end
end
