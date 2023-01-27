require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'

class App
  @@welcome_message = 'Welcome to School Library App!',
  @@menu_message = 'Please choose an option by entering a number:'
  
  def initialize
    @books = []
    @students = []
    @teachers = []
    @rentals = []
  end

  def run
    puts "#{@@welcome_message}\n"
    puts @@menu_message

    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    case gets.chomp
      when '1'
        list_books
      when '2'
        list_people
      when '3'
        create_person
      when '4'
        create_book
      when '5'
        create_rental
      when '6'
        puts 'ID:'
        id = gets.chomp
        list_rentals(id)
      when '7'
        puts 'Thank you for using this app!'
        exit
      else
        puts 'That is not a valid input'
      end
      run
  end

  private

  def list_books
    @books.each { |book| puts book }
  end

  def people
    [*@students, *@teachers]
  end

  def list_people
    @people.each { |person| puts person }
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_class = gets.chomp

    if person_class != '1' && person_class != '2'
      puts 'That is not a valid input. Person creation failed.'
      return
    end

    print 'Age: '
    age = gets.chomp

    print 'Name: '
    age = gets.chomp

    if person_class == '1'
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
    elsif person_class == '2'
      print 'Specialization: '
      specialization = gets.chomp
    end

    if person_class == '1'
      @students << Student.new(age, nil, name, parent_permission)
    elsif person_class == '2'
      @teachers << Teacher.new(age, specialization, name)
    end

    puts "Person created successfully\n"
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    
    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)

    puts "Book created successfully\n"
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) #{book}" }
    book_index = gets.chomp.to_i
    
    puts 'Select a person from the following list by number (not id)'
    people.each_with_index { |person, index| puts "#{index}) #{person}" }
    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], people[person_index])
  rescue
    puts 'That is not a valid input. Rental creation failed.'
  end

  def list_rentals(id)
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each { |rental| puts rental if rental.person.id == id }
  end
end
