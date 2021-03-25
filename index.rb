require_relative 'lib/hangman_class'

first_argument, *command_argument = ARGV
ARGV.clear
case first_argument
when '--help'
  puts 'This is a hangman app'
  puts 'Figure out yourself'
when '--start', '-s'

  hangman = Hangman.new
  case command_argument[0]
  when 'movie'
    word = hangman.generate_word(1)
    game = Game.new(word)
    game = game.run
  when 'game'
    word = hangman.generate_word(2)
    game = Game.new(word)
    game = game.run
  when 'programming'
    word = hangman.generate_word(3)
    game = Game.new(word)
    game = game.run
  else
    puts 'Invalid option'
  end
else
  hangman = Hangman.new
  hangman.run_app
end
