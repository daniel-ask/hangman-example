require 'faker'
require_relative 'game_class'

class Hangman
  def run_app
    loop do
      display_welcome
      display_menu
      process_input(menu_input)
    end
  end

 def display_welcome
  puts '-' * 20
  puts 'WELCOME TO HANGMAN'
  puts '-' * 20
 end

 def display_menu
  puts '1.  Play game'
  puts '2.  Exit'
 end

 def display_categories
  puts 'Choose your category:'
  puts "\t1. Movie"
  puts "\t2. Game"
  puts "\t3. Programming Language"
 end

 def menu_input
  gets.to_i
 end

 def process_input(menu_selection)
  case menu_selection
  when 1
    initiate_game 
  when 2
    exit_game
  end
 end

 def initiate_game
  # get category selection
  display_categories
  menu_selection = menu_input
  # generate word
  word = generate_word(menu_selection)
  # start game
  game = Game.new(word)
  game.run
 end

 def generate_word(menu_selection)
  case menu_selection
  when 1
    Faker::Movie.title
  when 2
    Faker::Game.title
  when 3
    Faker::ProgrammingLanguage.name
  end
 end
 def exit_game
  puts 'Good Bye'
  exit
 end
end