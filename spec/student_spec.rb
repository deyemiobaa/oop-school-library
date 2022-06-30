require '../student'

describe Student do
  it 'is an instance of Student' do
    student = Student.new
    expect(student).to be_instance_of(Student)
  end

  it 'student that is less than 18 and without parent permission is not allowed to use services' do
    student = Student.new(15, 'John', false, 'classroom')
    expect(student.can_use_services?).to eq(false)
  end

  it 'student that is 18 or above and without parent permission is allowed to use services' do
    student = Student.new(18, 'John', false, 'classroom')
    expect(student.can_use_services?).to eq(true)
  end

  it 'convert student data to json string' do
    student = Student.new(18, 'John', false, 'classroom')
    expect(student.to_json).to be_instance_of(String)
  end
end
