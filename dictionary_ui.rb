require './lib/term'

def main_menu

  puts "Press 'a' to create a new term or 'l' to list all of your words."
  puts "Press 'x' to exit"
  main_choice = gets.chomp
  case main_choice
  when 'a'
    add_term
  when 'l'
    list_words
  when 'x'
    exit
  end
  main_menu
end

def add_term
  puts "Please enter a word to define:"
  word = gets.chomp.to_s
  puts "Enter your definition for #{word}:"
  definition = gets.chomp.to_s

  new_term = Term.create(word, definition)
  puts "#{new_term.full_entry} has been created"

  main_menu
end

def list_words
  Term.all.each_with_index {|object, index| puts (index+1).to_s + ": " + object.word}
  puts "Please type a number to see a word's definition."
  word_lookup = gets.chomp.to_i
  display_term = Term.all[word_lookup-1].full_entry
  puts display_term
  list_menu
end

def list_menu
  puts "Press 'e' to edit a term or press 'd' to delete a term."
  puts "Press 'a' to add another term"
  term_choice = gets.chomp.to_s
  case term_choice
  when 'a'
    add_term
  when 'd'
    delete_term
  when 'e'
    edit_term
  else
    main_menu
  end
end

def delete_term
  puts "Enter the number of the term to delete"
  term_choice = gets.chomp.to_i
  Term.all[term_choice-1].delete
  puts "the term has been deleted"
  list_words
end

def edit_term
  puts "Enter the number of the term to edit"
  term_choice = gets.chomp.to_i
  term_to_edit = Term.all[term_choice-1]
  puts "Editing #{Term.all[term_choice-1].full_entry}"
  puts "Do you want to edit the word: #{term_to_edit.word}? y/n"
  input = gets.chomp.to_s.downcase
  case input
  when "y"
    puts "Enter updated word:"
    edited_word = gets.chomp.to_s
  else
    edited_word = term_to_edit.word
  end
  puts "Do you want to edit the definition: #{term_to_edit.definition}? y/n"
  input = gets.chomp.to_s.downcase
  case input
  when "y"
    puts "Enter updated definition:"
    edited_definition = gets.chomp.to_s
  else
    edited_definition = term_to_edit.definition
  end

  Term.all[term_choice-1].edit(edited_word, edited_definition)
  puts "The edited term is #{Term.all[term_choice-1].full_entry}"

  list_words

end

system 'clear'
main_menu
