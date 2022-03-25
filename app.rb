require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    puts @books
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  def create_student
    print 'Age '
    age = gets.chomp

    print 'Name '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    has_permission = gets.chomp
    parent_permission = has_permission.include? 'Yy'

    @people << Student.new(age, name, parent_permission)
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age '
    age = gets.chomp

    print 'Name '
    name = gets.chomp

    print 'Specialization '
    specialization = gets.chomp

    @people << Teacher.new(age, specialization, name)
    puts 'Person created successfully'
  end

  def create_person
    print 'Do you want to create a student(1) a teacher(2)? [Input tNhe number]:'
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author : '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created sucessfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "(#{index}) - Title: #{book.title}, Author: #{book.author}"
    end

    selected_book = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "[#{index}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end

    selected_person = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @books[selected_book], @people[selected_person])

    puts 'Rental created successfully'
  end

  def list_all_rentals
    print 'Enter person id '
    person_id = gets.chomp.to_i

    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book: #{rental.book.title}, Person: #{rental.person.name}"
      end
    end
  end
end
