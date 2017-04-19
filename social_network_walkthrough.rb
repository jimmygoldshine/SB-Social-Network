require './lib/social_network.rb'
require './lib/user_profile.rb'
require './lib/message.rb'

def social_network_walkthrough
  network = SocialNetwork.new(UserProfile, Message)
  puts "\n  ***This is the walkthrough for the SB-Social-Network*** \n"
  profile1 = network.sign_up
  puts "\n  ***OK! Time to get another profile!*** \n"
  profile2 = network.sign_up
  puts "\n  *** Let's check out how many users are now on the SB-Social-Network*** \n\n"
  network.show_all_users
  puts "\n  ***Now that there are two profiles, let's connect them! We'll switch into #{profile1.name}'s user profile and add #{profile2.name}*** \n"
  profile1.add_friend
  puts "\n  ***Let's send a message from #{profile1.name} to #{profile2.name}!*** \n\n"
  profile1.send_message
  puts "\n  ***Let's switch into #{profile2.name}'s profile and check their messages!*** \n"
  profile2.check_messages
  puts "\n  ***Now that #{profile2.name} has read his unread messages these are moved from the unread messages box. When #{profile2.name} checks again:*** \n"
  profile2.check_messages
  puts "\n  ***That sums up this command line walkthrough!*** \n"
end

social_network_walkthrough
