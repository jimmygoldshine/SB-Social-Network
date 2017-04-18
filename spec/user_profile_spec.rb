require 'spec_helper'

describe UserProfile do

  let(:network) {double(:network)}
  let(:profile) {described_class.new(network)}
  let(:elon_profile) {double(:elon_profile)}

  describe "New profile" do

    before do
      allow_any_instance_of(UserProfile).to receive(:gets).and_return("James","Dix")
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

    it "should raise an error if no users are found" do
      profile.add_friend
      expect{profile.add_friend}.to raise_error("No users found with that name. Please try again")
    end
  end

end
