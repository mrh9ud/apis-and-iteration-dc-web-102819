def welcome
  puts "May the Force Be With You"
end

def get_character_from_user
  puts "please enter a character name"
  gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
  user_input = gets.chomp.downcase
  puts user_input
end

get_character_from_user