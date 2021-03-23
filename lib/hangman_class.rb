require 'faker'
require 'json'
require_relative 'game_class'

class HangMan

  def initialize
    @data = JSON.parse(File.read('./data/game_score.json'))
    @data['Daniel'] = 1
    p @data
    File.write('./data/game_score.json', JSON.dump(@data))
  end

  def run_app
    loop do
      display_title
      display_menu
      process_menu_selection(user_menu_input)
    end
  end

  def display_title
    puts 'WELCOME TO HANGMAN'
  end

  def display_menu
    puts '1. Start game'
    puts '2. End game'
  end

  def user_menu_input
    gets.to_i
  end

  def start_game(word)
    game = Game.new(word)
    game.run
  end

  def display_category
    puts 'Select Category:'
    puts "\t1. Movie"
    puts "\t2. Game"
    puts "\t3. Programming Languages"
  end
  
  def select_category
    gets.to_i
  end

  def generate_word(category)
    case category
    when 1
      return Faker::Movie.title 
    when 2
     return Faker::Game.title
    when 3
     return Faker::ProgrammingLanguage.name
    end
  end

  def process_menu_selection(selection)
    case selection
    when 1
      display_category
      word = generate_word(select_category)
      start_game(word)
    when 2
      puts '- Exiting -'
      sleep 1
      exit
    else
      puts 'Invalid input'
    end
  end
end
