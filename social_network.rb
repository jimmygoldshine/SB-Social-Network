require './lib/social_network.rb'
require './lib/user_profile.rb'
require './lib/message.rb'

def social_network_tutorial
  network = SocialNetwork.new(UserProfile, Message)
  puts "\n  ***This is the tutorial for the social_network*** \n"
  profile1 = network.sign_up
  puts "\n  ***OK! Time to get another profile!*** \n"
  profile2 = network.sign_up
  puts "\n  ***Now we have two profiles, let's connect. We'll switch into #{profile1.name} and add #{profile2.name}*** \n"
  profile1.add_friend
  puts "\n  ***Let's send a message from #{profile1.name} to #{profile2.name}!*** \n\n"
  profile1.send_message
  puts "\n  ***Let's switch into #{profile2.name}'s profile and check their messages!*** \n"
  profile2.check_messages
  puts "\n  ***Now that #{profile2.name} has read his unread_messages his unread messages box should be empty*** \n"
  profile2.check_messages
  puts "\n  ***That sums up this command line tutorial!*** \n"
end

social_network_tutorial
