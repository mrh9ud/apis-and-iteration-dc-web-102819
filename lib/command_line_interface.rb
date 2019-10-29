def welcome
  puts "May the Force be with You"
  # puts out a welcome message here!
end


def get_character_from_user
  puts "please enter a character name"
  user_input = gets.chomp.downcase
  user_input
  # use gets to capture the user's input. This method should return that input, downcased.
end