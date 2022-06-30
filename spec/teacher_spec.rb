require '../teacher'

describe Teacher do
  it 'is an instance of Teacher' do
    teacher = Teacher.new('John', 40, 'law')
    expect(teacher).to be_instance_of(Teacher)
  end

  it 'teacher is allowed to use services regardless of age' do
    teacher = Teacher.new('John', 16, 'intern')
    expect(teacher.can_use_services?).to eq(true)
  end

  it 'convert teacher data to json string' do
    teacher = Teacher.new('John', 18, 'classroom')
    expect(teacher.to_json).to be_instance_of(String)
  end
end