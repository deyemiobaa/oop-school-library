def create_service(option)
  case option
  when 3
    create_person
  when 4
    create_book
  when 5
    create_rental
  end
end

def create_person
  puts 'Do you want to create a 1) Student or 2) Teacher: [Input 1 or 2]'
  option = gets.chomp
  case option
  when '1'
    create_student
  when '2'
    create_teacher
  else
    puts 'Invalid option!'
  end
end

def create_teacher
  puts 'Enter teacher name:'
  name = gets.chomp
  puts 'Enter teacher age:'
  age = gets.chomp.to_i
  puts 'Enter teacher specialization:'
  specialization = gets.chomp
  teacher = Teacher.new(name, age, specialization)
  @app.add_person(teacher)
  puts "\nTeacher #{name} created!"
end

def create_student
  puts 'Enter student name:'
  name = gets.chomp
  puts 'Enter student age:'
  age = gets.chomp.to_i
  puts 'Enter student classroom (Grade 1, Grade 2, etc):'
  classroom = gets.chomp
  puts 'Enter student parent permission (Y/N):'
  parent_permission = gets.chomp.to_s == 'Y'
  student = Student.new(age, name, parent_permission, classroom)
  @app.add_person(student)
  puts "\nStudent #{name} created!"
end

def create_book
  puts 'Enter book title: '
  title = gets.chomp
  puts 'Enter book author: '
  author = gets.chomp
  book = Book.new(title, author)
  @app.add_book(book)
  puts "\nBook #{title} created!"
end

def create_rental
  puts 'Enter person index from list below (Not ID):'
  list_people
  person_id = gets.chomp.to_i
  person = @app.people[person_id]
  if check_permission(person)
    puts 'Enter book index from list below (Not ID):'
    list_books
    book_id = gets.chomp.to_i
    puts 'Enter rental date (YYYY-MM-DD):'
    date = gets.chomp
    rental = Rental.new(date, @app.people[person_id], @app.books[book_id])
    @app.add_rental(rental)
    puts '\nRental created!'
  else
    puts '\nYou do not have permission to rent books!'
  end
end

def check_permission(person)
  person.can_use_services?
end
