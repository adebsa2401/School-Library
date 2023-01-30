require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @students = []
    @teachers = []
    @rentals = []
  end

  def list_books
    @books.each { |book| puts book }
    puts
  end

  def people
    [*@students, *@teachers]
  end

  def list_people
    people.each { |person| puts person }
    puts
  end

  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    case gets.chomp.upcase
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    else
      puts 'That is not a valid input. Person creation failed.'
      return
    end

    @students << Student.new(age, nil, name, parent_permission:)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    @teachers << Teacher.new(age, specialization, name)
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '

    case gets.chomp
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'That is not a valid input. Person creation failed.'
      return
    end

    print "Person created successfully\n\n"
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)

    print "Book created successfully\n\n"
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) #{book}" }
    book_index = gets.chomp.to_i
    puts

    puts 'Select a person from the following list by number (not id)'
    people.each_with_index { |person, index| puts "#{index}) #{person}" }
    person_index = gets.chomp.to_i
    puts

    print 'Date: '
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], people[person_index])

    print "Rental created successfully\n\n"
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each { |rental| puts rental if rental.person.id == id }
    puts
  end

  def exit_app
    puts 'Thank you for using this app!'
    exit
  end
end
