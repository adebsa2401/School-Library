class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    @book.rentals << self
    @person.rentals << self
  end

  def to_s
    "Date: #{@date}, Book #{@book.title} by #{@book.author}"
  end
end
