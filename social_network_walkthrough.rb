require './lib/social_network.rb'
require './lib/user_profile.rb'
require './lib/message.rb'

def social_network_walkthrough
  network = SocialNetwork.new(UserProfile, Message)
  puts "\n  ***This is the walkthrough for the SB-Social-Network*** \n"
  puts "\nWelcome new user, to the SB-Social-Network! To sign up we'll need a few details... \n"
  puts "First Name: "
  profile1_first_name = gets.chomp
  puts "Last Name: "
  profile1_last_name = gets.chomp
  profile1 = network.sign_up(profile1_first_name, profile1_last_name)
  puts "\n  ***OK! Time to get another profile!*** \n"
  puts "First Name: "
  profile2_first_name = gets.chomp
  puts "Last Name: "
  profile2_last_name = gets.chomp
  profile2 = network.sign_up(profile2_first_name, profile2_last_name)
  puts "\n  *** Let's check out how many users are now on the SB-Social-Network*** \n\n"
  network.show_all_users
  puts "\n  ***Now that there are two profiles, let's connect them! We'll switch into #{profile1.name}'s user profile and add #{profile2.name}*** \n"
  puts "\n#{profile1.name}, you would like to add a friend... what's their full name?"
  friend_name = gets.chomp
  profile1.add_friend(friend_name)
  puts "\nWe successfully found #{friend_name}! You are now friends - go say hi! \n"
  puts "\n  ***Let's send a message from #{profile1.name} to #{profile2.name}!*** \n\n"
  puts "To:"
  to = gets.chomp
  puts "Message:"
  message = gets.chomp
  profile1.write_message(to, message)
  puts "  ***The message is now saved in drafts! It will stay here until you use message send. Once we hit send...***"
  profile1.send_message
  puts "\n\n  ***Your message was sent to #{profile2.name}*** \n\n"
  puts "\n  ***Let's switch into #{profile2.name}'s profile and check their messages!*** \n"
  profile2.check_messages
  puts "\n  ***Now that #{profile2.name} has read his unread messages these are moved from the unread messages box. When #{profile2.name} checks again:*** \n"
  profile2.check_messages
  puts "\n  ***That sums up this command line walkthrough!*** \n"
end

social_network_walkthrough
