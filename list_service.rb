def list_service(option)
  case option
  when 1
    list_books
  when 2
    list_people
  when 6
    list_rental_by_person_id
  end
end

def list_people
  if @app.people.empty?
    puts 'No persons available, create one first'
    main
  end
  puts 'List of people:'
  @app.people.each_with_index do |person, index|
    puts "(#{index}) - Name: #{person.name} ID: #{person.id} Age: #{person.age}"
  end
end

def list_books
  if @app.books.empty?
    puts 'No books available, create one first'
    main
  end
  puts 'List of books:'
  @app.books.each_with_index do |book, index|
    puts "(#{index}) - Author: #{book.author} Title: #{book.title}"
  end
end

def list_rental_by_person_id
  puts 'Enter person ID:'
  person_id = gets.chomp.to_i
  rentals_list = @app.rentals.select { |rental| rental.person.id == person_id }
  if rentals_list.empty?
    puts 'No rentals found for this ID!'
  else
    rentals_list.each do |rental|
      puts "#{rental.person.name} rented \"#{rental.book.title}\" by \"#{rental.book.author}\" on #{rental.date},"
    end
  end
end
