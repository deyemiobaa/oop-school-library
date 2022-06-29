require 'json'

class Storage
  attr_reader :filename

  def initialize
    @filename = %w[rentals.json people.json books.json]
  end

  def create_file
    @filename.each do |file|
      File.new(file, 'w+') unless File.exist?(file)
    end
  end

  def save_data(data)
    create_file
    save_people(data)
    save_rentals(data)
    save_books(data)
  end

  def save_people(data)
    json_data = JSON.generate(data.people)
    File.write('people.json', json_data)
  end

  def save_rentals(data)
    json_data = JSON.generate(data.rentals)
    File.write('rentals.json', json_data)
  end

  def save_books(data)
    json_data = JSON.generate(data.books)
    File.write('books.json', json_data)
  end

  def load_data(app)
    load_people(app)
    load_rentals(app)
    load_books(app)
  end

  def load_books(app)
    return unless File.exist?('books.json')
    return unless File.empty?('books.json')

    file = File.open('books.json')
    file_data = file.read.split
    file_data.each { |data| app.add_book(JSON.parse(data)) }
  end

  def load_people(app)
    return unless File.exist?('people.json')
    return unless File.empty?('people.json')

    file = File.open('people.json')
    file_data = file.read.split
    file_data.each { |data| app.add_person(JSON.parse(data)) }
  end

  def load_rentals(app)
    return unless File.exist?('rentals.json')
    return unless File.empty?('rentals.json')

    file = File.open('rentals.json')
    file_data = file.read.split
    file_data.each { |data| app.add_rental(JSON.parse(data)) }
  end
end
