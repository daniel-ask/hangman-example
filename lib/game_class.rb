class Game
 def initialize(word)
  @word = word
  @lives = @word.length + 2
  @guessed_letters = []
  @game_state = true
 end

 def run
  while @game_state
    system 'clear'
    line_seperator
    display_word
    display_lives
    display_guessed_letters
    line_seperator
    display_instructions
    process_input(user_input)
  end
 end

 def line_seperator
  puts "<>"* 10
 end

 def display_guessed_letters
  puts "Guessed letters:"
  @guessed_letters.each do |letter|
    print "#{letter.upcase} "
  end
  puts
 end

 def display_word
  @word.chars.each do |char|
    if @guessed_letters.include?(char) || !char.match?(/^[a-z]+$/)
      print "#{char.upcase} "
    else
      print '_ '
    end
  end
  puts
 end

 def display_lives
  puts "You have #{@lives} lives left"
 end

 def display_instructions
  puts 'Enter a letter or your guess:'
 end

 def user_input
  gets.strip.downcase
 end

 def process_input(input)
  if input.length > 1 
    process_guess(input)
  elsif !(input.match?(/^[a-z]+$/)) || @guessed_letters.include?(input)
    puts 'Invalid Input'
    sleep 1
  else
    process_letter(input)
  end
 end

 def process_letter(letter)
  @guessed_letters << letter
  update_lives(letter)
  check_lives
 end

 def process_guess(guess)
  if @word == guess
    win
  else
    game_over
  end
 end

 def update_lives(letter)
    @lives -= 1 unless @word.include?(letter)
 end

 def check_lives
  return unless @lives <= 0
  game_over
 end
 def game_over
  # Guard clause
   puts 'GAME OVER'
   puts "The word was: #{@word}"
   @game_state = false
 end
 
 def win
  puts 'YOU WON CONGRATS'
  @game_state = false
 end
end