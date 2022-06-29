require 'json'
require './student'
require './teacher'
require './book'
require './rental'

class Storage
  attr_reader :filename

  def initialize
    @filename = %w[rentals.json people.json books.json]
  end

  def create_file
    @filename.each { |file| File.new(file, 'w+') unless File.exist?(file) }
  end

  def save_data(app)
    create_file
    save_people(app)
    save_rentals(app)
    save_books(app)
  end

  def save_people(data)
    people_data = data.people.map do |person|
      if person.is_a?(Teacher)
        {
          name: person.name,
          age: person.age,
          specialization: person.specialization
        }
      else
        {
          name: person.name,
          age: person.age,
          classroom: person.classroom,
          parent_permission: person.parent_permission
        }
      end
    end
    json_data = JSON.generate(people_data)
    File.write('people.json', json_data)
  end

  def save_rentals(data)
    rentals_data = data.rentals.map do |rental|
      {
        date: rental.date,
        person: rental.person.to_json,
        book: rental.book.to_json
      }
    end
    json_data = JSON.generate(rentals_data)
    File.write('rentals.json', json_data)
  end

  def save_books(data)
    books_data = data.books.map do |book|
      {
        title: book.title,
        author: book.author
      }
    end
    json_data = JSON.generate(books_data)
    File.write('books.json', json_data)
  end

  def load_data(app)
    load_people(app)
    load_rentals(app)
    load_books(app)
  end

  def load_books(app)
    return unless File.exist?('books.json')
    return if File.empty?('books.json')

    file = File.read('books.json')
    file_data = JSON.parse(file)
    file_data.each do |data|
      book = Book.new(data['title'], data['author'])
      app.add_book(book)
    end
  end

  def load_people(app)
    return unless File.exist?('people.json')
    return if File.empty?('people.json')

    file = File.read('people.json')
    file_data = JSON.parse(file)
    file_data.each do |data|
      if data.key?('specialization')
        app.add_person(Teacher.new(data['name'], data['age'], data['specialization']))
      else
        app.add_person(Student.new(data['age'], data['name'], data['parent_permission'], data['classroom']))
      end
    end
  end

  def load_rentals(app)
    return unless File.exist?('rentals.json')
    return if File.empty?('rentals.json')

    file = File.read('rentals.json')
    file_data = JSON.parse(file)
    file_data.each do |data|
      if Student.from_json(data['person']).is_a? Student
        student = Student.from_json(data['person'])
        book = Book.from_json(data['book'])
        app.add_rental(Rental.new(data['date'], student, book))
      else
        teacher = Teacher.from_json(data['person'])
        book = Book.from_json(data['book'])
        app.add_rental(Rental.new(data['date'], teacher, book))
      end
    end
  end
end
