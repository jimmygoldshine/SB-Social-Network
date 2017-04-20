require 'spec_helper'

describe UserProfile do

  first_name1 = "James"
  last_name1 = "Dix"
  first_name2 = "Elon"
  last_name2 = "Musk"

  let(:network) {double(:network)}
  let(:message_class) {double(:message_class)}
  let(:my_profile) {described_class.new(network, message_class, first_name1, last_name1)}
  let(:elon_profile) {described_class.new(network, message_class, first_name2, last_name2)}
  let(:message) {double(:message)}

  before do
    allow(network).to receive(:all_users)
  end

  describe "New profile" do

    it "should have a friends list of 0" do
      expect(my_profile.friends.length).to eq(0)
    end

    it "should be initialized with a First Name and Last Name" do
      expect(my_profile.name).to eq("James Dix")
    end

  end

  describe "Add a friend" do

    friend_name1 = "Elon Musk"
    friend_name2 = "Barry White"

    before do
      allow(network).to receive(:all_users).and_return({:"Elon Musk" => elon_profile })
    end

    it "should allow a user to add existing users to friend list" do
      my_profile.add_friend(friend_name1)
      expect(my_profile.friends).to eq({:"Elon Musk" => elon_profile})
    end

    it "should raise an error if friend_name does not correspond with an existing profile" do
      expect{my_profile.add_friend(friend_name2)}.to raise_error("No users found with that name. Are you sure they have a profile?!")
    end

  end

  describe "Sending / Receiving Messages" do

    friend_name1 = "Elon Musk"
    friend_name2 = "Barry White"
    message_body = "Bonjourno"

    before do
      allow(network).to receive(:all_users).and_return({:"Elon Musk" => elon_profile })
      my_profile.add_friend(friend_name1)
      allow(message_class).to receive(:new).with(my_profile).and_return(message)
      allow(message).to receive(:write).with(friend_name1, message_body).and_return(message)
      allow(message).to receive(:send).and_return(elon_profile.unread_messages << message)
    end

    it "should start with 0 new messages" do
      expect(my_profile.unread_messages.length).to eq(0)
    end

    it "should create a draft message" do
      my_profile.write_message(friend_name1, message_body)
      expect(my_profile.draft_message).to eq(message)
    end

    it "should error if there is no draft message to send" do
      expect{my_profile.send_message}.to raise_error("No draft message to send")
    end

    it "should receive a message into unread_messages" do
      draft_message = my_profile.write_message(friend_name1, message_body)
      my_profile.send_message
      expect(elon_profile.unread_messages.count).to eq(1)
    end

    it "should output 0 new messages after all read" do
      my_profile.instance_variable_set(:@unread_messages, [message])
      allow(message).to receive(:read).and_return("test message")
      my_profile.check_messages
      expect{my_profile.check_messages}.to output("\n James Dix, you have 0 new messages\n").to_stdout
    end

  end

end
