require 'spec_helper'

describe UserProfile do

  let(:network) {double(:network)}
  let(:message_class) {double(:network_class)}
  let(:profile) {described_class.new(network, message_class)}
  let(:elon_profile) {double(:elon_profile)}
  let(:message) {double(:message)}

  describe "New profile" do

    before do
      allow_any_instance_of(UserProfile).to receive(:gets).and_return("James","Dix")
      allow(network).to receive(:all_users).and_return({:"Elon Musk" => elon_profile })
    end

    it "should have a friends list of 0" do
      expect(profile.friends.length).to eq(0)
    end

    it "should be initialized with a First Name and Last Name" do
      expect(profile.name).to eq("James Dix")
    end

  end

  describe "Add a friend" do

    before do
      allow_any_instance_of(UserProfile).to receive(:gets).and_return("James","Dix", "Elon Musk", "Barry White")
      allow(network).to receive(:all_users).and_return({:"Elon Musk" => elon_profile })
    end

    it "should allow a user to add existing users to friend list" do
      profile.add_friend
      expect(profile.friends).to eq({:"Elon Musk" => elon_profile})
    end

  end

  describe "Any unread messages?" do

    before do
      allow_any_instance_of(UserProfile).to receive(:gets).and_return("James","Dix")
      allow(network).to receive(:all_users).and_return({:"Elon Musk" => elon_profile })
    end

    it "should output 0 new messages" do
      profile.check_messages
      expect{profile.check_messages}.to output("\n James Dix, you have 0 new messages\n").to_stdout
    end

    it "should output 1 new messages" do
      profile.instance_variable_set(:@unread_messages, [message])
      allow(message).to receive(:read).and_return("test message")
      expect{profile.check_messages}.to output("\nJames Dix, you have 1 new message: \ntest message \n\n").to_stdout
    end

    it "should output 0 new messages after all read" do
      profile.instance_variable_set(:@unread_messages, [message])
      allow(message).to receive(:read).and_return("test message")
      profile.check_messages
      expect{profile.check_messages}.to output("\n James Dix, you have 0 new messages\n").to_stdout
    end

  end

end
