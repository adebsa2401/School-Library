#!/usr/bin/env ruby

require_relative 'app'

class Main
  def initialize
    @app = App.new
    @welcome_message = 'Welcome to School Library App!'
    @menu_message = 'Please choose an option by entering a number:'

    @options = [
      { label: 'List all books', action: :list_books },
      { label: 'List all people', action: :list_people },
      { label: 'Create a person', action: :create_person },
      { label: 'Create a book', action: :create_book },
      { label: 'Create a rental', action: :create_rental },
      { label: 'List all rentals for a given person id', action: :list_rentals },
      { label: 'Exit', action: :exit_app }
    ]

    print "#{@welcome_message}\n\n"
  end

  def run
    puts @menu_message
    @options.each_with_index { |option, index| puts "#{index + 1} - #{option[:label]}" }
    @app.send(@options[gets.chomp.to_i - 1][:action])

    run
  end
end

main = Main.new
main.run
