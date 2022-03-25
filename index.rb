#!/usr/bin/env ruby
require './app'

class MainEntryPoint
  def initialize
    @entry_point = App.new
  end

  def user_options
    puts
    puts 'Please choose an option by entering a number'
    puts ['1 - List all books', '2 - List all people', '3 - Create a person', '4 - Create a book',
          '5 - Create a rental', '6 - List all rentals for a given person', '7 - Exit']
  end

  def process_option
    user_input = gets.chomp
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
    end
  end

  def run
    user_input = nil
    puts 'Welcome to School Library App!'

    while user_input != '7'
      user_options
      process_option
    end
  end
end

def main
  app = MainEntryPoint.new
  app.run
end

main
