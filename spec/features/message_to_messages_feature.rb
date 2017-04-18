require 'spec_helper'

describe "Feature testing" do

  network = SocialNetwork.new(UserProfile)
  puts "My Profile:"
  my_profile = network.sign_up
  puts "Friends profile:"
  friends_profile = network.sign_up
  puts "Add friend: "
  my_profile.add_friend
  message = Message.new(my_profile)

  it "a message should arrive into friends profile from my_profile" do
    puts "Send Message: "
    message.send
    expect(friends_profile.messages.length).to eq(1)
  end

end
