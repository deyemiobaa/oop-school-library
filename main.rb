require './app'
require './create_service'
require './list_service'

@app = App.new

def main
  puts "\n\nWelcome to School Library App!\n\n"
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts "7 - Exit\n\n"
  option = gets.chomp.to_i

  perform_action(option)
end

def perform_action(option)
  case option
  when 1..2, 6
    list_service(option)
    main
  when 3..5
    create_service(option)
    main
  else
    end_program(option)
    exit
  end
end

def end_program(option)
  puts option == 7 ? 'Thank you for using the School Library App. See you next time!' : 'Invalid option. Try again.'
end

main
