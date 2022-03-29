#!/usr/bin/env ruby
require './process'

class MainEntryPoint
  def initialize
    @processor = OptionProcessor.new
  end

  def user_options
    puts
    puts 'Welcome to the library! Please choose what you want to do'
    puts ['1 - List all books', '2 - List all people', '3 - Create a person', '4 - Create a book',
          '5 - Create a rental', '6 - List all rentals for a given person', '7 - Exit']
  end

  def run
    user_input = nil
    puts 'Welcome to School Library App!'

    while user_input != '7'
      user_options
      user_input = gets.chomp
      @processor.process_option(user_input)
    end
  end
end

def main
  app = MainEntryPoint.new
  app.run
end

main
