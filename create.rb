require './student'
require './teacher'

class PersonCreator
  def initialize(type)
    @age = nil
    @name = nil
    @person = nil
    @type = type
  end

  def receive_general_info
    print 'Age '
    @age = gets.chomp

    print 'Name '
    @name = gets.chomp
  end

  def receive_additional_info
    if @type == 'student'
      print 'Parent permission '
      has_permission = gets.chomp
      parent_permission = has_permission.include? 'Yy'
      @person = Student.new(@age, @name, parent_permission)
    else
      print 'Specialization '
      received_specialization = gets.chomp
      specialization = received_specialization
      @person = Teacher.new(@age, @name, specialization)
    end
  end

  def create_person
    receive_general_info
    receive_additional_info
    puts 'Person created successfully'
    @person
  end
end
