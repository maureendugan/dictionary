require './lib/term'

def main_menu
  system 'clear'
  puts "Press 'a' to create a new word or 'l' to list all of your words."
  puts "Press 'x' to exit"
  main_choice = gets.chomp
  case main_choice
  when 'a'
    add_word
  when 'l'
    list_words
  when 'x'
    exit
  end
  main_menu
end

def add_word
  puts "Please enter a word to define:"
  word = gets.chomp.to_s
  puts "Enter your definition for #{word}:"
  definition = gets.chomp.to_s

  new_term = Term.create(word, definition)
  puts "Your term has been created"
  main_menu
end


def list_word

end







main_menu
