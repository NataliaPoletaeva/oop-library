require './app'

class OptionProcesor
  def initialize
    @entry_point = App.new
  end

  def process_option(user_input)
    case user_input
    when '1'
      @entry_point.list_all_books
    when '2'
      @entry_point.list_all_people
    when '3'
      @entry_point.create_person
    when '4'
      @entry_point.create_book
    when '5'
      @entry_point.create_rental
    when '6'
      @entry_point.list_all_rentals
    when '7'
      exit
    else
      puts 'Wrong input! Enter a number 1 - 7.'
    end
  end
end
